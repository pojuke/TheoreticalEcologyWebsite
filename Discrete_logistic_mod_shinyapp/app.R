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
            numericInput("r",
                        "r = ",
                        min = 1.5,
                        max = 3,
                        value = 2,
                        step = 0.01),
            sliderInput("N",
                        "N0 = ",
                        min = 0,
                        max = 120,
                        value = 10,
                        step = 10),
            sliderInput("K",
                        "K = ",
                        min = 100,
                        max = 600,
                        value = 500,
                        step = 10)
        ),  


        # Main plot panel
        mainPanel(
            uiOutput("ui_plot")
        )
    )
)

# Define server
server <- function(input, output) {

    output$Logistic_plot <- renderPlot({
        
        # Parameters
        r <- input$r
        K <- input$K
        N0 <- input$N
        time <- 100
        
        # Equation
        log_fun <- function(r, N, K){N + r*N*(1-N/K)}  
        
        # for loop
        pop_size <- numeric(time)
        pop_size[1] <- N0
        
        for (i in 2:time) {pop_size[i] <- log_fun(r = r, N = pop_size[i - 1], K = K)}
        
        pop_data <- pop_size %>% 
            as.data.frame() %>% 
            rename(., pop_size = `.`) %>%
            mutate(time = 0:(time-1)) %>%
            relocate(time)
        
        P1 <- ggplot(pop_data, aes(x = time, y = pop_size)) + 
            geom_point() + 
            geom_line() +
            geom_hline(yintercept = K, color = "red", size = 1.2, linetype = "dashed") + 
            geom_text(x = time*1.02, y = K+50, label = "italic(K)", color = "red", size = 6.5, parse = T) +
            labs(y = expression(italic(N)), title = paste0("Discrete logistic growth", "\n", "(r = ", r, ", K = ", K, ", N0 = ", N0, ")")) + 
            scale_x_continuous(limits = c(0, time*1.05), expand = c(0, 0)) + 
            scale_y_continuous(limits = c(0, max(pop_size)*1.1), expand = c(0, 0)) + 
            theme_bw(base_size = 15) +
            theme(plot.title = element_text(hjust = 0.5))
        
        cobweb_data <- data.frame(Nt = rep(pop_size[-time], each = 2), 
                                  Nt1 = c(0, rep(pop_size[-1], each = 2)[-length(rep(pop_size[-1], each = 2))]))
        
        logistic_map <- data.frame(Nt = seq(0, (r+1)/r*K, by = 0.1)) %>%
            mutate(Nt1 = Nt + r*Nt*(1-Nt/K))
        
        P2 <- ggplot() + 
            geom_line(data = logistic_map, aes(x = Nt, y = Nt1), color = "green", size = 1.2) + 
            geom_path(data = cobweb_data, aes(x = Nt, y = Nt1), color = "blue", size = 0.5) + 
            geom_abline(slope = 1, intercept = 0, color = "red", size = 1) + 
            labs(x = expression(italic(N[t])),
                 y = expression(italic(N[t+1])), 
                 title = paste0("Cobweb plot/logistic map", "\n", "(r = ", r, ", K = ", K, ", N0 = ", N0, ")")) + 
            scale_x_continuous(limits = c(0, (r+1)/r*K*1.05), expand = c(0, 0)) + 
            scale_y_continuous(limits = c(0, max(pop_size)*1.1), expand = c(0, 0)) + 
            theme_bw(base_size = 15) +
            theme(plot.title = element_text(hjust = 0.5),
                  panel.grid = element_blank())
        
        grid.arrange(P1, P2, ncol = 1)
})
    output$ui_plot <- renderUI({
        plotOutput("Logistic_plot", height = 700)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)


