N <- 1e+4
out <- replicate(N, mean((2^rgeom(1000, .5))-20))


hist(out)


hist(log(out))





## ST. PETERSBURG PARADOX
## ----------------------

StPetersburg <- function(n) {
  ## Simulates the St. Petersburg paradox.

  sapply(1:n, function(i) {
    pot.amount <- 1
    while (TRUE) {
      if (sample(c("H","T"), 1) == "H") pot.amount <- pot.amount*2
      else break
    }
    return(pot.amount)
  })
}

StPetersburg(1)

mean(StPetersburg(100000))
mean(StPetersburg(100000))
mean(StPetersburg(100000))
mean(StPetersburg(100000))
mean(StPetersburg(100000))
mean(StPetersburg(100000))

range(StPetersburg(100000))

## We can do our best to give a real "approximate" value.

mean(sapply(1:10000, function(i) mean(StPetersburg(10000))))



## Anybody want to play??? :)