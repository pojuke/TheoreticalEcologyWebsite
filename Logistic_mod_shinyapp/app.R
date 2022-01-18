library(shiny)
library(tidyverse)
library(deSolve)

# Define UI for application
ui <- fluidPage(

    sidebarLayout(
        fluid = F,
        
        # Sidebar with a slider input
        sidebarPanel(
            sliderInput("N",
                        "N0 = ",
                        min = 0,
                        max = 1000,
                        value = 10,
                        step = 10),
            sliderInput("r",
                        "r = ",
                        min = 0,
                        max = 2,
                        value = 1,
                        step = 0.1),
            sliderInput("K",
                        "K = ",
                        min = 0,
                        max = 1000,
                        value = 500,
                        step = 10),
            sliderInput("time",
                        "time = ",
                        min = 0,
                        max = 20,
                        value = 10,
                        step = 0.1)
        ),  


        # Main plot panel
        mainPanel(
           plotOutput("Logistic_plot")
        )
    )
)

# Define server
server <- function(input, output) {

    output$Logistic_plot <- renderPlot({
        
        # Run the ode based on ui inputs
        logistic_model <- function(times, state, parms) {
            with(as.list(c(state, parms)), {
                dN_dt = r*N*(K-N)/K 
                return(list(c(dN_dt))) 
            })
        }
        
        times <- seq(0, input$time, by = 0.1)  
        state <- c(N = input$N)  
        parms <- c(r = input$r, K = input$K) 
        pop_size <- ode(func = logistic_model, times = times, y = state, parms = parms)
        
        ggplot(data = as.data.frame(pop_size), aes(x = time, y = N)) + 
            geom_point() + 
            geom_hline(yintercept = input$K, linetype = "dotted", color = "red", size = 1) + 
            annotate(geom = "text", x = input$time/2, y = input$K*1.075, label = "italic(K)", color = "red", size = 8, parse = T) +
            labs(title = paste0("Logistic Growth \n (N0 = ", state["N"], ", r = ", parms["r"], ", K = ", parms["K"], ")")) +
            theme_classic(base_size = 20) + 
            theme(plot.title = element_text(hjust = 0.5)) +
            scale_x_continuous(limits = c(0, input$time + 0.5), expand = c(0, 0)) +
            scale_y_continuous(limits = c(0, max(as.data.frame(pop_size)$N)*1.2), expand = c(0, 0))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)


