library(data.table)

## Is faster and more memory efficient than data.frames
## Faster at subsetting, group and updating

DF <- data.frame(x=rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
head(DF,3)

DT <- data.table(x=rnorm(9), y=rep(c("a","b","c"), each = 3), z=rnorm(9))
head(DT,3)

tables() ## to see all the data.tables in memory

## Subsetting rows

DT[2,]

DT[DT$y =="a"]

DT[c(2,3)] ## Subset on rows

## Subsetting columns

## Expressions are created like
{}

## If you write an expression on the second space of a data.table,
## you can apply functions to data.table functions

DT[, list(mean(x),sum(z))]

## Add new columns (a new copy is not created)
DT[, w:= z^2]

## Multiple operations (multi step operations)

DT[,m:={tmp <- (x+z); log2(tmp+5)}]

DT[,a:=x>0]

DT[, b:=mean(x+w),by=a] ## Takes the mean when a == TRUE

## Special variables
## .N An integer of length 1, containing the number
set.seed(123)
DT <- data.table(x=sample(letters[1:3],1E5,TRUE))
DT[, .N, by=x] #.N counts the number of times each variable apears

## Keys
DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
setkey(DT,x)
DT['a']

## Joins
DT1 <- data.table(x=c('a','b','c','dt1'),y=1:4)
DT2 <- data.table(x=c('a','b','c','dt2'),z=5:7)
setkey(DT1,x); setkey(DT2,x)
merge(DT1,DT2)

