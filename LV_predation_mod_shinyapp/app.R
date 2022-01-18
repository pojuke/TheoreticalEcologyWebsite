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
      sliderInput("a",
                  "a = ",
                  min = 0,
                  max = 1,
                  value = 0.1,
                  step = 0.01),
      sliderInput("e",
                  "e = ",
                  min = 0,
                  max = 1,
                  value = 0.8,
                  step = 0.01),
      numericInput("N",
                   "N0 = ",
                   min = 0,
                   max = 50,
                   value = 10,
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
  
  output$LV_predation_plot <- renderPlot({
    
    ### Model specification
    LV_predation_model <- function(times, state, parms) {
      with(as.list(c(state, parms)), {
        dN_dt = r*N - a*N*P
        dP_dt = e*a*N*P - d*P
        return(list(c(dN_dt, dP_dt)))  
      })
    }
    
    ### Model parameters
    times <- seq(0, 1000, by = 0.005)
    state <- c(N = input$N, P = input$P)
    parms <- c(r = 1.0, a = input$a, e = input$e, d = 0.5)
    
    ### Model application
    pop_size <- ode(func = LV_predation_model, times = times, y = state, parms = parms)
    
    
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
      theme_classic(base_size = 12) +
      labs(x = "Time", y = "Population size") +
      scale_x_continuous(limits = c(0, 100.5), expand = c(0, 0.05)) +
      scale_y_continuous(limits = limit_fun, expand = c(0, 0.05)) +
      scale_color_brewer(name = NULL, palette = "Set1", labels = c("Prey", "Predator"), direction = -1)
    
    ### State-space diagram
    P2 <- pop_size %>%
      as.data.frame() %>%
      ggplot(aes(x = N, y = P)) + 
      geom_path() + 
      theme_classic(base_size = 12) +
      labs(x = "Prey", y = "Predator") + 
      scale_x_continuous(limits = limit_fun, expand = c(0, 0)) +
      scale_y_continuous(limits = limit_fun, expand = c(0, 0)) + 
      coord_fixed(ratio = 1)
    
    grid.arrange(P1, P2, ncol = 1)
  })
  output$ui_plot <- renderUI({
    plotOutput("LV_predation_plot", height = 700)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)


