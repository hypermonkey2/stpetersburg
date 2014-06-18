n<-5000
set<-StPetersburg(n)

bet<-15

#set of cumulative winnings
wset<-numeric(n)

for(i in 1:n){
if (i==1) {wset[i]=set[1]}
if (i>1) { wset[i]<-set[i]+wset[i-1]}

}

#set of cumulative spent

bset<-numeric(n)

for(i in 1:n){

bset[i]<-i*bet


}

#cumulative profit set
pset<-wset-bset
plot(pset)

