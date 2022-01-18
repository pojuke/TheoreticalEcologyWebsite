library(shiny)
library(tidyverse)
library(deSolve)
library(gridExtra)

# Define UI for application
ui <- fluidPage(
    
    sidebarLayout(
        fluid = F,
        
        # Sidebar with a slider input
        sidebarPanel(
            style = "margin-top: 100px;",
            sliderInput("a",
                        "a = ",
                        min = 0,
                        max = 2,
                        value = 1.3,
                        step = 0.01),
            sliderInput("h",
                        "h = ",
                        min = 0,
                        max = 1,
                        value = 0.9,
                        step = 0.01),
            sliderInput("e",
                        "e = ",
                        min = 0,
                        max = 1,
                        value = 0.6,
                        step = 0.01),
            numericInput("N",
                         "N0 = ",
                         min = 0,
                         max = 50,
                         value = 5,
                         step = 5),
            numericInput("P",
                         "P0 = ",
                         min = 0,
                         max = 25,
                         value = 2,
                         step = 5)
        ),  
        
        
        # Main plot panel
        mainPanel(
            uiOutput("ui_plot")
        )
    )
)

# Define server
server <- function(input, output) {
    
    output$RM_predation_plot <- renderPlot({
        
        ### Model specification
        RM_predation_model <- function(times, state, parms) {
            with(as.list(c(state, parms)), {
                dN_dt = r*N*(1-(N/K))-(a*N/(1+a*h*N))*P
                dP_dt = e*(a*N/(1+a*h*N))*P-d*P
                return(list(c(dN_dt, dP_dt)))  
            })
        }
        
        ### Model parameters
        times <- seq(0, 500, by = 0.01)
        state <- c(N = input$N, P = input$P)
        parms <- c(r = 1.0, K = 5.0, a = input$a, h = input$h, e = input$e, d = 0.5)
        
        ### Model application
        pop_size <- ode(func = RM_predation_model, times = times, y = state, parms = parms)
        
        
        ### Customized limit function
        limit_fun <- function(x){
            if(max(x) < 50) {
                c(0, 50)
            } else {
                c(0, max(x)*1.05)
            }
        }
        
        ### Population trajectories
        P1 <- pop_size %>%
            as.data.frame() %>%
            pivot_longer(cols = -time, names_to = "species", values_to = "N") %>%
            ggplot(aes(x = time, y = N, color = species)) + 
            geom_line(size = 1.5) +
            theme_classic(base_size = 14) +
            labs(x = "Time", y = "Population size") +
            scale_x_continuous(limits = c(0, 500.5), expand = c(0, 0)) +
            scale_y_continuous(limits = c(0, max(pop_size[, -1])*1.2), expand = c(0, 0)) +
            scale_color_brewer(name = NULL, palette = "Set1", labels = c("Prey", "Predator"), direction = -1)
        
        ### State-space diagram
        P2 <- pop_size %>%
            as.data.frame() %>%
            ggplot(aes(x = N, y = P)) + 
            geom_path() + 
            geom_vline(xintercept = with(as.list(parms), d/(e*a-a*d*h)), color = "#E41A1C", size = 1) +
            geom_function(data = data.frame(x = seq(0, 5, 0.01)), aes(x = x), 
                          fun = function(n){with(as.list(parms), r*(1+a*h*n)*(1-n/K)/a)}, 
                          inherit.aes = F, color = "#377EB8", size = 1) + 
            geom_point(aes(x = with(as.list(parms), d/(e*a-a*d*h)), 
                           y = with(as.list(parms), r*(1+a*h*d/(e*a-a*d*h))*(1-d/(e*a-a*d*h)/K)/a)), 
                       size = 2.5) +
            theme_classic(base_size = 14) +
            theme(axis.line.x = element_line(color = "#E41A1C", size = 1),
                  axis.line.y = element_line(color = "#377EB8", size = 1)) + 
            labs(x = "Prey", y = "Predator") + 
            scale_x_continuous(limits = c(0, max(pop_size[, "N"]*1.05)), expand = c(0, 0)) + 
            scale_y_continuous(limits = c(0, max(pop_size[, "P"]*1.05)), expand = c(0, 0))
        
        grid.arrange(P1, P2, ncol = 1)
    })
    output$ui_plot <- renderUI({
        plotOutput("RM_predation_plot", height = 700)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)


