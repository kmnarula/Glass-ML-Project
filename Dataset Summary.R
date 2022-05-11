# General useful information about the dataset

# Analysing the dataset through numerical methods:

# Loading the required libraries:
library(caret)

# Loading the dataset:
data(Glass)

# The dimmenssions of the dataset:
dim(Glass)

# First 10 rows of the dataset:
head(Glass, 9)

# Listing the levels of the class:
levels(Glass$Type)

# Indicating the type of each attribute of the dataset:
sapply(Glass, class)

# Summarising the distribution of the data:
percentage <- prop.table(table(Glass$Type)) * 100
cbind(freq=table(Glass$Type), percentage=percentage)

# Correlation matrix:
glass.cor<-cor(Glass[,1:9])
glass.cordf<-data.frame(glass.cor) 
glass.cort<-glass.cor/sqrt((1-glass.cor^2)/(nrow(Glass)-2))
index<-upper.tri(glass.cor)
cor.g<-round(glass.cor,4)
cor.g[index]<-""
cor.g<-data.frame(cor.g)
cor.gt<-round(glass.cort,4)
cor.gt[index]<-""
cor.gt<-data.frame(cor.gt)
cor.g
cor.gt


# Analyzing the dataset through graphical methods:

# Splitting the input and the output:
x <- Glass[,1:9]
y <- Glass[,10]

# Boxplot:
par(mfrow=c(1,9))
for(i in 1:9) {
  boxplot(x[,i], main=names(Glass)[i])
}

# Scatter-plot Matrix:
featurePlot(x = Glass[, 1:9], 
            y = Glass$Type, 
            plot = "ellipse", 
            ## Add a key at the top
            auto.key = list(columns = 7))



# Whisker Plot:
featurePlot(x = Glass[, 1:9], y = Glass$Type, plot="box")


# Density Plot:
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

# Pair plot:
pairs(Glass[,1:9],col="black",lower.panel=panel.smooth,pch=20)

# Trace elements plot:
ggscatmat(Glass,columns=1:9,color=NULL)+
  theme_grey(base_size=10)+
  geom_point(colour="lightseagreen",na.rm=TRUE)+ #na.rm=remove records for which the data are missing
  labs(title="XY Plot of Trace Elements \n (with Density and Correlation)")+
  theme(plot.title = element_text(size = rel(1.5)))+
  labs(xlab(" "))+
  labs(ylab(" "))

# Heat map:
glass.cor2<-gather(glass.cordf) 
glass.cor2$names<- names(glass.cordf) 
glass.cor2$names<-factor(glass.cor2$names,
                         levels=rev(names(glass.cordf))) 
ggplot(glass.cor2,aes(x=key,y=names))+
  geom_tile(aes(fill = value),colour = "white")+
  scale_fill_gradient2(limits=c(-1,1),low = "red",high = "darkblue")+
  labs(list(title="Heatmap of Correlations of Independent Variables",x="Trace Element",y="Trace Element"))+
  theme(plot.title = element_text(size = rel(1.5)))

# Scatter-plot of different pair of elements
x.var<-c("RI","RI","Mg","Mg","Al")
y.var<-c("Si","Ca","Al","Ba","Ba")
by.var<-"Type"
for(i in 1:length(x.var)){
  x2<-x.var[i]
  y2<-y.var[i]
  readline(prompt="Click return/enter to view the next plot>> ")
  x.pos<-diff(range(Glass[,x2]))*.25+min(Glass[,x2])
  y.pos<-diff(range(Glass[,y2]))*.85+min(Glass[,y2])
  coef<-coef(lm(Glass[,y2]~Glass[,x2]))  
  print(ggplot(Glass,aes_string(x=x2,y=y2,colour=by.var,fill=by.var))+
          geom_point()+
          labs(title=paste("Series Chart",i,": Scatterplot of",x2,"and",y2,"\n (Color by",by.var,"of Glass)"))+
          geom_abline(intercept=coef[1],slope=coef[2],colour="darkgrey")+
          annotate("text",x=x.pos,y=y.pos,label=paste("Correlation=",
                                                      round(cor(Glass[x2],Glass[y2]),3)))
  )
}

# Histogram of the trace of the elements in the dataset:
skew.g<-sapply(Glass[,1:9],function(x){round(skewness(x),4)})
elem<-names(Glass)
for(i in 1:9){
  readline(prompt="Click return/enter to view the next plot>> ")
  quad.pos<-diff(range(Glass[,i]))*.75+min(Glass[,i])
  quad.neg<-diff(range(Glass[,i]))*.25+min(Glass[,i])
  x.g<-ifelse(skew.g[i]>=0,quad.pos,quad.neg) 
  binw.g<-diff(range(Glass[,i]))/20 
  suppressWarnings(print(
    ggplot(Glass,aes_string(x=elem[i],fill="Type"))+
      geom_histogram(stat="bin",binwidth=binw.g)+
      ggtitle(paste("Series Chart",i,": Histogram of Trace Chemical",elem[i],"\n(Color by Type of Glass)"))+
      annotate("text",label=paste("Skewness=",skew.g[i]),x=x.g,y=25)
  )
  )
}

