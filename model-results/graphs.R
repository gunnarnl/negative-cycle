library(jsonlite)
library(tidyverse)

setwd("~/Projects/negative-cycle/model-results")

null <- fromJSON("LUM1-null.json")
yes <- fromJSON("LUM1-yes.json")
no <- fromJSON("LUM1-no.json")
emphno <- fromJSON("LUM1-emphno.json")

null$x <- sapply(null$x, paste, collapse=",")
yes$x <- sapply(yes$x, paste, collapse=",")
no$x <- sapply(no$x, paste, collapse=",")
emphno$x <- sapply(emphno$x, paste, collapse=",")

null <- as_tibble(null)
yes <- as_tibble(yes)
no <- as_tibble(no)
emphno <- as_tibble(emphno)

no$utt <- 'no'
null$utt <- 'null'
yes$utt <- 'yes'
emphno$utt <- 'emphno'

alld <- union(no, null)
alld <- union(alld, yes)
alld <- union(alld, emphno)

era1 <- filter(alld, sub==1)
era2 <- filter(alld, sub==2)
era3 <- filter(alld, sub==3)
era4 <- filter(alld, sub==4)
era5 <- filter(alld, sub==5)

p1 <- ggplot() + geom_bar(data=era1, aes(fill=utt, y=y, x=x), position="fill", stat="identity") + labs(x = "Belief state", y = "S2 Probability", fill="Utterance") + theme_minimal()
p2 <- ggplot() + geom_bar(data=era2, aes(fill=utt, y=y, x=x), position="fill", stat="identity") + theme_minimal()
p3 <- ggplot() + geom_bar(data=era3, aes(fill=utt, y=y, x=x), position="fill", stat="identity") + theme_minimal()
p4 <- ggplot() + geom_bar(data=era4, aes(fill=utt, y=y, x=x), position="fill", stat="identity") + theme_minimal()
p5 <- ggplot() + geom_bar(data=era5, aes(fill=utt, y=y, x=x), position="fill", stat="identity") + theme_minimal()

sub.labs <- c("no: 1, emph no: 2", "no: 1, emph no: 1.5", "no: 1, emph no: 1", "no: 1.5, emph no: 1", "no: 2, emph no: 1")
names(sub.labs) <- c(1, 2, 3, 4, 5)

pall <- ggplot() + geom_bar(data=alld, aes(fill=utt, y=y, x=x), position="fill", stat="identity") + facet_wrap(. ~ sub, ncol=5, labeller = labeller(sub = sub.labs))
pall +
  labs(x = "Belief state", y = "S2 Probability", fill="Utterance") +
  scale_fill_manual(values=c("#FF3333", "#335BFF", "#999999", "#FFEC33"))
      
    spread(null, key=utt, value=y)
