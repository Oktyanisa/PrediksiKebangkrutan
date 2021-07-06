




library(shiny)
library(shinythemes)




ui <- fluidPage(theme = shinytheme("slate"),
  tabsetPanel(
    tabPanel("About Apps",
             
             h3("KRUPTION", style="color:red; text-align:center"),
             br(),
             h4("Kesehatan keuangan perusahaan dapat dilihat dari kondisi kinerja keuangan yang tercantum di laporan keuangan. Jika terjadi masalah pada keuangan perusahaan dalam jangka waktu yang lama akan menyebabkan kebangkrutan, Pentingnya perusahaan mendeteksi kebangkrutan dini agar tidak tergusur oleh perusahaan lain. Aplikasi ini hadir untuk memudahkan perusahaan untuk memprediksi kebangkrutan suatu perusahaan Manufaktur di bidang Industri Barang Konsumsi", 
                style="color:black; text-align:center")
    ),
    tabPanel("Input Data",
             sidebarLayout(
               sidebarPanel(
                 HTML("<h3>Masukkan Data Perusahaan</h3>"),
                 textInput("Kode", "Kode Perusahaan"),
                 textInput("nama", "Nama Perusahaan"),
                 textInput("aset", "Aset Lancar"),
                 textInput("laba", "Laba Ditahan"),
                 textInput("ebit", "Earnings Before Interest and Taxes"),
                 textInput("saham", "Jumlah Saham"),
                 textInput("hargashm", "Harga Saham"),
                 textInput("pendapatan", "Penjualan Bersih"),
                 textInput("totaset", "Total Aset"),
                 textInput("liabilitas", "Total Liabilitas"),
                 actionButton("prediksi","Predict"),
                 actionButton("hapus", "Clear")
               ),
               mainPanel(
                 tags$label(h3('Prediksi Kebangkrutan')), # Status/Output Text Box
                 verbatimTextOutput('contents'),
                 tableOutput('tabledata'), # Prediction results table
                 tags$label(h2('Saran '), h4("Akan diberikan saran sesuai prediksi"))
               )
             )
    ),
    tabPanel("Feedback Us",
             HTML("<h3>Kejujuran Anda kualitas kami</h3>"),
             
             sliderInput("mudah", "Kemudahan dalam penggunaan :",
                         min = 1, max = 5,
                         value = 1),
             sliderInput("puas", "Kepuasan dalam pelayanan :",
                         min = 1, max = 5,
                         value = 1),
             sliderInput("rekomen", "kemungkinan merekomendasikan kepada orang lain :",
                         min = 1, max = 5,
                         value = 1),
            textInput("kritik", label = "Kritik :"),
            textInput("saran", label = "Saran :"),
             
            actionButton("submitbutton", "Submit"),
            actionButton("kembali", "Back to Home")
    )
    
  )
  
)







