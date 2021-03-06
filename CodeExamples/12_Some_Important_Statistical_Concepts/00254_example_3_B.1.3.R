# example:3_B.1.3 
# example:3 : Some important statistical concepts : A few important distributions : The binomial distribution 
# Title: 
                    Simulating a binomial distribution 


                    Simulating a binomial distribution
                     # use rbinom to simulate flipping a coin of probability p N times

p75 <- 0.75 # a very unfair coin (mostly heads)
N <- 1000  # flip it several times
flips_v1 <- rbinom(N, 1, p75)

# Another way to generated unfair flips is to use runif:
# the probability that a uniform random number from [0 1)
# is less than p is exactly p. So "less than p" is "heads".
flips_v2 <- as.numeric(runif(N) < p75) 

prettyprint_flips <- function(flips) {
  outcome <- ifelse(flips==1, "heads", "tails")
  table(outcome)
}

prettyprint_flips(flips_v1)
# outcome
# heads tails 
# 756   244 
prettyprint_flips(flips_v2)
# outcome
# heads tails 
# 743   257

