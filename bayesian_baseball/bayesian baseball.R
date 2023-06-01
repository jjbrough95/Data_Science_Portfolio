bbteams <- read.csv("baseball_reference_2016_clean.csv", header = TRUE, sep = ",")
head(bbteams)

# National League Home
ny <- subset(bbteams, home_team=="New York Mets")
cc <- subset(bbteams, home_team=="Chicago Cubs")
la <- subset(bbteams, home_team=="Los Angeles Dodgers")
ab <- subset(bbteams, home_team=="Atlanta Braves")
mb <- subset(bbteams, home_team=="Milwaukee Brewers")
sl <- subset(bbteams, home_team=="St. Louis Cardinals")
ph <- subset(bbteams, home_team=="Philadelphia Phillies")
wn <- subset(bbteams, home_team=="Washington Nationals")
cn <- subset(bbteams, home_team=="Cincinnati Reds")
sf <- subset(bbteams, home_team=="San Francisco Giants")
cr <- subset(bbteams, home_team=="Colorado Rockies")
pp <- subset(bbteams, home_team=="Pittsburgh Pirates")
ad <- subset(bbteams, home_team=="Arizona Diamondbacks")
mm <- subset(bbteams, home_team=="Miami Marlins")
sd <- subset(bbteams, home_team=="San Diego Padres")
nathome <- rbind(ny,cc,la,ab,mb,sl,ph,wn,cn,sf,cr,pp,ad,mm,sd)
#nathomehits <- nathome$home_team_hits
#nathomeruns <- nathome$home_team_runs
# National League Away
ny <- subset(bbteams, away_team=="New York Mets")
cc <- subset(bbteams, away_team=="Chicago Cubs")
la <- subset(bbteams, away_team=="Los Angeles Dodgers")
ab <- subset(bbteams, away_team=="Atlanta Braves")
mb <- subset(bbteams, away_team=="Milwaukee Brewers")
sl <- subset(bbteams, away_team=="St. Louis Cardinals")
ph <- subset(bbteams, away_team=="Philadelphia Phillies")
wn <- subset(bbteams, away_team=="Washington Nationals")
cn <- subset(bbteams, away_team=="Cincinnati Reds")
sf <- subset(bbteams, away_team=="San Francisco Giants")
cr <- subset(bbteams, away_team=="Colorado Rockies")
pp <- subset(bbteams, away_team=="Pittsburgh Pirates")
ad <- subset(bbteams, away_team=="Arizona Diamondbacks")
mm <- subset(bbteams, away_team=="Miami Marlins")
sd <- subset(bbteams, away_team=="San Diego Padres")
nataway <- rbind(ny,cc,la,ab,mb,sl,ph,wn,cn,sf,cr,pp,ad,mm,sd)
#natawayhits <- nataway$away_team_hits
#natawayruns <- nataway$away_team_runs
# American League Home
nyy <-subset(bbteams, home_team=="New York Yankees")
brs <-subset(bbteams, home_team=="Boston Red Sox")
laa <-subset(bbteams, home_team=="Los Angeles Angels of Anaheim")
ha <-subset(bbteams, home_team=="Houston Astros")
oa <-subset(bbteams, home_team=="Oakland Athletics")
ci <-subset(bbteams, home_team=="Cleveland Indians")
sm <-subset(bbteams, home_team=="Seattle Mariners")
tbr <-subset(bbteams, home_team=="Tampa Bay Rays")
cws <-subset(bbteams, home_team=="Chicago White Sox")
tbj <-subset(bbteams, home_team=="Toronto Blue Jays")
bo <-subset(bbteams, home_team=="Baltimore Orioles")
mt <-subset(bbteams, home_team=="Minnesota Twins")
kcr <-subset(bbteams, home_team=="Kansas City Royals")
tr <-subset(bbteams, home_team=="Texas Rangers")
dt <-subset(bbteams, home_team=="Detroit Tigers")
amhome <- rbind(nyy,brs,laa,ha,oa,ci,sm,tbr,cws,tbj,bo,mt,kcr,tr,dt)
#amhomehits <- amhome$home_team_hits
#amhomeruns <- amhome$home_team_runs
# American League Away
nyy <-subset(bbteams, away_team=="New York Yankees")
brs <-subset(bbteams, away_team=="Boston Red Sox")
laa <-subset(bbteams, away_team=="Los Angeles Angels of Anaheim")
ha <-subset(bbteams, away_team=="Houston Astros")
oa <-subset(bbteams, away_team=="Oakland Athletics")
ci <-subset(bbteams, away_team=="Cleveland Indians")
sm <-subset(bbteams, away_team=="Seattle Mariners")
tbr <-subset(bbteams, away_team=="Tampa Bay Rays")
cws <-subset(bbteams, away_team=="Chicago White Sox")
tbj <-subset(bbteams, away_team=="Toronto Blue Jays")
bo <-subset(bbteams, away_team=="Baltimore Orioles")
mt <-subset(bbteams, away_team=="Minnesota Twins")
kcr <-subset(bbteams, away_team=="Kansas City Royals")
tr <-subset(bbteams, away_team=="Texas Rangers")
dt <-subset(bbteams, away_team=="Detroit Tigers")
amaway <- rbind(nyy,brs,laa,ha,oa,ci,sm,tbr,cws,tbj,bo,mt,kcr,tr,dt)
#amawayhits <- amaway$away_team_hits
#amawayruns <- amaway$away_team_runs

#na.omit(x)
##National League Home Games
mean((nathome$home_team_runs/nathome$home_team_hits), na.rm = TRUE) #average ratio of runs to hits
mean((sum(nathome$home_team_runs)/length(nathome$home_team_runs))) #average runs per game
mean((sum(nathome$home_team_hits)/length(nathome$home_team_hits))) #average hits per game
##National League Away Games
mean((nataway$away_team_runs/nataway$away_team_hits), na.rm = TRUE) #average ratio of runs to hits
mean((sum(nataway$away_team_runs)/length(nataway$away_team_runs))) #average runs per game
mean((sum(nataway$away_team_hits)/length(nataway$away_team_hits))) #average hits per game

##American League Home Games
mean((amhome$home_team_runs/amhome$home_team_hits), na.rm = TRUE) #average ratio of runs to hits
mean((sum(amhome$home_team_runs)/length(amhome$home_team_runs))) #average runs per game
mean((sum(amhome$home_team_hits)/length(amhome$home_team_hits))) #average hits per game
##American League Away Games
mean((amaway$away_team_runs/amaway$away_team_hits), na.rm = TRUE) #average ratio of runs to hits
mean((sum(amaway$away_team_runs)/length(amaway$away_team_runs))) #average runs per game
mean((sum(amaway$away_team_hits)/length(amaway$away_team_hits))) #average hits per game
#####

#each team plays 162 games per regular season and I figured that they would score just over 4 
#runs per game and thats where my prior of a=700 and b=162 come from
#american league home runs
x <- seq(0,6,length=500)
plot(x,dgamma(x,(700+5646),(162+1230)), type = "l", main = "American league runs per home game", 
     xlab = "Runs", ylab = "Density", col = "blue", xlim = c(2,6))
lines(x,dgamma(x,700,162), col = "red")
legend("topleft", legend = c("prior", "posterior"), col = c("Red", "Blue"), 
       pch = c(19,19), bty = "n", pt.cex = 1, cex = 0.8, text.col = "black", horiz = F , inset = c(0.1, 0.1))
#american league away runs
plot(x,dgamma(x,(700+5432),(162+1229)), type = "l", main = "American league runs per away game",
     xlab = "Runs", ylab = "Density", col = "Blue", xlim = c(2,6))
lines(x,dgamma(x,700,162), col = "red")
legend("topleft", legend = c("prior", "posterior"), col = c("Red", "Blue"), 
       pch = c(19,19), bty = "n", pt.cex = 1, cex = 0.8, text.col = "black", horiz = F , inset = c(0.1, 0.1))
#national league home runs
plot(x,dgamma(x,(700+5486),(162+1233)), type = "l", main = "National league runs per home game", 
     xlab = "Runs", ylab = "Density", col = "blue", xlim = c(2,6))
lines(x,dgamma(x,700,162), col = "red")
legend("topleft", legend = c("prior", "posterior"), col = c("Red", "Blue"), 
       pch = c(19,19), bty = "n", pt.cex = 1, cex = 0.8, text.col = "black", horiz = F , inset = c(0.1, 0.1))
#national league away runs
plot(x,dgamma(x,(700+5439),(162+1234)), type = "l", main = "National league runs per away game", 
     xlab = "Runs", ylab = "Density", col = "blue", xlim = c(2,6))
lines(x,dgamma(x,700,162), col = "red")
legend("topleft", legend = c("prior", "posterior"), col = c("Red", "Blue"), 
       pch = c(19,19), bty = "n", pt.cex = 1, cex = 0.8, text.col = "black", horiz = F , inset = c(0.1, 0.1))


x <- rgamma(100000,(700+sum(amhome$home_team_runs)),(162+length(amhome$home_team_runs)))-rgamma(100000,(700+sum(nathome$home_team_runs)),(162+length(nathome$home_team_runs)))
plot(density(x), col="Blue", main = "Posterior Difference in runs per game", xlab =expression(theta["AL"]-theta["NL"])) #poisson-gamma

y <- rgamma(100000,(700+sum(amaway$away_team_runs)),(162+length(amaway$away_team_runs)))-rgamma(100000,(700+sum(nataway$away_team_runs)),(162+length(nataway$away_team_runs)))
lines(density(y), col='Red')
legend("topright", legend = c("Away games", "Home games"), col = c("Red", "Blue"), 
       pch = c(19,19), bty = "n", pt.cex = 1, cex = 0.8, text.col = "black", horiz = F , inset = c(0.1, 0.1))

plot(density(rgamma(100000,(700),(162))-rgamma(100000,(700),(162))), main = "Prior difference in runs per game", xlab =expression(theta["AL"]-theta["NL"]))


quantile(y,c(.025,.975)) #95% CI for away games    (-0.1450893  0.1668267)
quantile(x,c(.025,.975)) #95% Ci for home games    (-0.0332435  0.2811786)
mean(y>0) #probability that the difference in away games is greater than 0    0.55741
mean(x>0) #probability that the difference in home games is greater than 0    0.94004
mean(y, na.rm = TRUE) #mean diff of away games
mean(x,na.rm = TRUE) #mean diff of home games

qgamma(c(.025,.975),(700+5646),(162+1230)) #amhome CI for runs per game
qgamma(c(.025,.975),(700+5432),(162+1229)) #amaway CI for runs per game
qgamma(c(.025,.975),(700+5486),(162+1233)) #nathome CI for runs per game
qgamma(c(.025,.975),(700+5439),(162+1234)) #nataway CI for runs per game
