# This simulation proves that switching doors
# in Monty Hall problem increases our chances of winning
# from 1/3 to 2/3.
# This simulation assumes that we pick a door randomly
# And a winning door is picked randomly.
# Winning rates will be asserted consequently. 
n <- 10000 # number of trials
winning_door <- sample(1:3, n, replace = T) # which door is a winning door
choice_1 <- sample(1:3, n, replace = T)

# if we keep the door - the probability
# of winning tends to 1/3.
result_no_switch <- NULL
for (i in 1:n){
 if (choice_1[i] == winning_door[i]){
   result_no_switch <- c(result_no_switch, 1)
 } else {
   result_no_switch <- c(result_no_switch, 0)
 }
}
#result_no_switch
win_rate_no_switch <- sum(result_no_switch)/length(result_no_switch)
win_rate_no_switch # 0.33


# if we switch the door after 1st choice
## after 1st choice 1 empty door is disregarded
## thus we have the door we chose and some other door.
result_switch <- NULL
for (i in 1:n){
  if (choice_1[i] == winning_door[i]){
    # if we switch from winning door to some other door (I.e. loosing door),
    # then we have lost.
    result_switch <- c(result_switch, 0)
  } else {
    # On the other hand, if at first we picked a wrong door,
    # if we switch, then we won.
    result_switch <- c(result_switch, 1)
  }
}
win_rate_switch <- sum(result_switch)/length(result_switch)
win_rate_switch # 0.66
## Basically, in the second part we swap 1 and 0,
# thus the probability is simply 1-1/3 = 2/3