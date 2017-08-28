


dashboardPage(
    dashboardHeader(title = "Enterprise Architect"),
    dashboardSidebar(
        sliderInput("rateThreshold", "Select Client Index",
                    min = 0, max = 50, value = 3, step = 0.1
        ),
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard")
        )
    ),
    dashboardBody(
        tabItems(
            tabItem("dashboard",
                    fluidRow(
                        valueBoxOutput("rate"),
                        valueBoxOutput("count"),
                        valueBoxOutput("users")
                    ),
                    fluidRow(
                        box(
                            width = 12, status = "info", solidHeader = TRUE,
                            title = "Abnormal Detection Panel",
                            dygraphOutput("dygraph")
                        ),
                        box(
                            width = 4, status = "info",
                            title = "Top packages (last 5 min)",
                            tableOutput("packageTable")
                        )
                    )
            ),
            tabItem("rawdata",
                    numericInput("maxrows", "Rows to show", 25),
                    verbatimTextOutput("rawtable"),
                    downloadButton("downloadCsv", "Download as CSV")
            )
        )
    )
)