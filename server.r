library(data.table)
library(randomForest)

Model <- readRDS("model.rds")
server <- function(input, output, session) {
  
  # Input Data
  datasetInput <- reactive({  
    
    
    df <- data.frame(
      Name = c("Kode",
               "nama",
               "aset",
               "laba",
               "ebit",
               "saham",
               "hargashm",
               "pendapatan",
               "totaset",
               "liabilitas"),
      Value = as.character(c(input$Kode,
                             input$nama,
                             input$aset,
                             input$laba,
                             input$ebit,
                             input$saham,
                             input$hargashm,
                             input$pendapatan,
                             input$totaset,
                             input$liabilitas)),
      stringsAsFactors = FALSE)
    
    prediksi <- "prediksi"
    df <- rbind(df, prediksi)
    input <- t(df)
    write.table(input,"input.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
    
    predik <- read.csv(paste("input", ".csv", sep=""), header = TRUE)
    
    predik$prediksi <- Model(input$aset, input$laba, input$ebit, input$saham,
                             input$hargashm, input$pendapatan, input$totaset, input$liabilitas)
    
    
    Output <- data.frame(prediction=predik$prediksi)
    print(Output)
    
  })
  
  # Status/Output Text Box
  output$contents <- renderPrint({
    if (input$submitbutton>0) { 
      isolate("Prediksi") 
    } else {
      return("Masukkan data disamping.")
    }
    
  })
  
  # Prediction results table
  output$tabledata <- renderTable({
    if (input$submitbutton>0) { 
      isolate(datasetInput()) 
    } 
  })
  
}
