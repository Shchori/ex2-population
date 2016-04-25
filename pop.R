#installations
install.packages(c("jsonlite","ggplot2","curl"))

#load
library("ggplot2")
library("jsonlite")
file= "http://data.okfn.org/data/core/population/r/population.json"
data=jsonlite::fromJSON(file)
name=data$`Country Name`
code=data$`Country Code`
year=as.numeric(data$Year)
pop=as.numeric(data$Value)
f=data.frame(name,code,year,pop)
s=split.data.frame(f,f$name)
barplot(s$`Israel`$pop,names.arg = s$`Israel`$year,xlab = "year",ylab = "population",col = "blue",
        main = "population in israel")

s2=split.data.frame(f,f$year)

top15= head(sort(s2$`2014`$pop,decreasing=TRUE), n = 5)
pie(top15,s2$`2014`$name)
