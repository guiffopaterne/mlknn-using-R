# reseau de neuronne avec neuralnet
    datasets_neural <-read.csv("Tp4117/datasets/datas.csv",sep = ';',header=TRUE,
                    dec = ".",fileEncoding = "latin1")
    description_label <- datasets_neural[is.na(datasets_neural$Latitude),]
    datasets_neural <-datasets_neural[!is.na(datasets_neural$Latitude),]
    datasets_neural$ID<-NULL
    datasets_neural$Place.names.1<-NULL
    datasets_neural$Place.names<-NULL
    datasets_neural$Latitude<-NULL
    datasets_neural$Longitude<-NULL
    datasets_neural[is.na(datasets_neural)]<-0
    elements<- list_classe(datasets_neural$City)
    datasets_neural<-binarizer_classe(datasets_neural,datasets_neural$City,elements)
    train_ind <- sample(seq_len(nrow(datasets_neural)), (8*nrow(datasets_neural))%/%10)
    datasets_neural_train <- datasets_neural[train_ind,-1]
    datasets_neural_test <- datasets_neural[-train_ind,-1]
    f<-paste(paste(elements,collapse = " + "),"~")
    n<-names(datasets_neural_train)
    f <- as.formula(paste(f, paste(n[!n %in% elements], collapse = " + ")))
    model_neural_net <- neuralnet( Baghdad+ Mosul + Dohuk+ Arbil+Sulaymaniyah + Babylon+ Basra+ Najaf+ Karbala+ Salahaddin+ Diyala+ Anbar+ Qadisiyah+Kirkuk+Dhi_Qar+Muthanna+Maysan+Wasit ~.,
                                 data=datasets_neural_train,hidden = 10)
    plot(model_neural_net)
    predict_neural_net <- compute(model_neural_net,datasets_neural_test)$net.result
    max_neural_net <- function (arr){ return (which(arr==max(arr)))}
    index_max <- apply(predict_neural_net,1,max_neural_net)
    predict <- predict_neural_net[index_max]
    table(predict,datasets_neural_test$Baghdad)
    datasets_kmeans<-read.csv("Tp4117/datasets/datas.csv",sep = ';',header=TRUE,
                    dec = ".",fileEncoding = "latin1")
    description_label <- datasets_kmeans[is.na(datasets_kmeans$Latitude),]
    datasets_kmeans <-datasets_kmeans[!is.na(datasets_kmeans$Latitude),]
    datasets_kmeans$ID<-NULL
    datasets_kmeans$Place.names.1<-NULL
    datasets_kmeans$Place.names<-NULL
    datasets_kmeans$City<-NULL
    datasets_kmeans[is.na(datasets_kmeans)]<-0
    km<-kmeans(datasets_kmeans[,c(1,3)],centers=3)
    plot(datasets_kmeans$Latitude,datasets_kmeans$Longitude,col = km$cluster,xlim=c(30,40),ylim = c(10,60))