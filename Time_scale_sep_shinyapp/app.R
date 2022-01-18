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
            style = "margin-top: 200px;",
            sliderInput("r",
                        "r = ",
                        min = 0,
                        max = 50,
                        value = 1,
                        step = 1),
            numericInput("N",
                         "N0 = ",
                         min = 0,
                         max = 60,
                         value = 40,
                         step = 5),
            radioButtons("P",
                         "P0 = ", 
                         choices = c("20" = 20, 
                                     "150" = 150, 
                                     "300" = 300),
                         selected = 20)
        ),  
        
        
        # Main plot panel
        mainPanel(
            uiOutput("ui_plot")
        )
    )
)

# Define server
server <- function(input, output) {
    
    output$Time_scale_sep_plot <- renderPlot({
        
        ### Model specification
        LV_logistic_model <- function(times, state, parms) {
            with(as.list(c(state, parms)), {
                dN_dt = r*N*(1-(N/K))-a*N*P
                dP_dt = e*a*N*P-d*P
                return(list(c(dN_dt, dP_dt)))  
            })
        }
        
        ### Model parameters
        times <- seq(0, 100, by = 0.01)
        state <- c(N = input$N, P = as.numeric(input$P))
        parms <- c(r = input$r, K = 60, a = 0.1, e = 0.1, d = 0.5)
        
        ### Model application
        pop_size <- ode(func = LV_logistic_model, times = times, y = state, parms = parms)
        
        ### Population trajectories
        P1 <- pop_size %>%
            as.data.frame() %>%
            pivot_longer(cols = -time, names_to = "species", values_to = "N") %>%
            ggplot(aes(x = time, y = N, color = species)) + 
            geom_line(size = 1.5) +
            theme_classic(base_size = 14) +
            labs(x = "Time", y = "Population size") +
            scale_x_continuous(limits = c(0, 100.5), expand = c(0, 0)) +
            scale_y_continuous(limits = c(0, max(pop_size[, -1])*1.2), expand = c(0, 0)) +
            scale_color_brewer(name = NULL, palette = "Set1", labels = c("Prey", "Predator"), direction = -1)
        
        ### State-space diagram
        P2 <- pop_size %>%
            as.data.frame() %>%
            ggplot(aes(x = N, y = P)) + 
            geom_point(color = "grey60", size = 3, shape = 21) + 
            geom_vline(xintercept = with(as.list(parms), d/(e*a)), color = "#E41A1C", size = 1) +
            geom_abline(slope = with(as.list(parms), -r/(a*K)), 
                        intercept = with(as.list(parms), r/a),
                        color = "#377EB8", size = 1) +
            geom_point(aes(x = with(as.list(parms), d/(e*a)),
                           y = with(as.list(parms), -r/(a*K)*d/(e*a) + r/a)),
                       size = 4) + 
            theme_classic(base_size = 14) +
            theme(axis.line.x = element_line(color = "#E41A1C", size = 1),
                  axis.line.y = element_line(color = "#377EB8", size = 1)) + 
            labs(x = "Prey", y = "Predator") +
            scale_x_continuous(limits = c(min(pop_size[, "N"])*0.9, max(pop_size[, "N"])*1.1))
            scale_y_continuous(limits = c(min(pop_size[, "P"])*0.5, max(pop_size[, "P"])*1.2))

        grid.arrange(P1, P2, ncol = 1)
    })
    output$ui_plot <- renderUI({
        plotOutput("Time_scale_sep_plot", height = 700)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)