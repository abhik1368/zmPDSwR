# example:2_B.1.3 
# example:2 : Some important statistical concepts : A few important distributions : The binomial distribution 
# Title: 
                    Working with the theoretical binomial distribution 


                    Working with the theoretical binomial distribution
                    p = 0.5 # the percentage of females in this student population
class.size <- 20 # size of a classroom
numclasses <- 100 # how many classrooms we observe

# what might a typical outcome look like?
numFemales <- rbinom(numclasses, class.size, p) 	# Note: 1 

# the theoretical counts (not necessarily integral)
probs <- dbinom(0:class.size, class.size, p)
tcount <- numclasses*probs

# the obvious way to plot this is with histogram or geom_bar
# but this might just look better

zero <- function(x) {0} # a dummy function that returns only 0

ggplot(data.frame(number.of.girls=numFemales, dummy=1),
  aes(x=number.of.girls, y=dummy)) + 
  # count the number of times you see x heads
  stat_summary(fun.y="sum", geom="point", size=2) + 	# Note: 2 
  stat_summary(fun.ymax="sum", fun.ymin="zero", geom="linerange") + 
  # superimpose the theoretical number of times you see x heads
  geom_line(data=data.frame(x=0:class.size, y=probs),
            aes(x=x, y=tcount), linetype=2) +
  scale_x_continuous(breaks=0:class.size, labels=0:class.size) +
  scale_y_continuous("number of classrooms")

# Note 1: 
#   because we didn't call set.seed, we expect 
#   different results each time we run this line. 

# Note 2: 
#   stat_summary is one of the ways to  
#   control data aggregation during plotting. In this case we are using it 
#   to place the dot and bar measured from the empirical data in with 
#   the theoretical density curve. 

