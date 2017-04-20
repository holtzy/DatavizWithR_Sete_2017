
# ==== libraries
library(shiny)
library(plotly)
library(ggplot2)
library(gapminder)



# ==== Server.R
server <- function(input, output) {
	output$plot <- renderPlotly({
		
		# Select data
		data=subset(gapminder, year==input$year)
		
		# Make the plot
		p=ggplot(data, 
  			aes(gdpPercap, lifeExp, size = pop, color = continent, frame = year)) +
  			geom_point()
  		ggplotly(p)
	})	
}



# ==== Ui.R
ui <- fluidPage(
	
	br(), br(),
	selectInput("year", "Select a year!", choices=unique(gapminder$year), selected=1952),
	plotlyOutput("plot")
)

shinyApp(ui = ui, server = server)

