//@version=5
indicator(shorttitle="BB", title="Bollinger Bands", overlay=true, timeframe="", timeframe_gaps=true, precision = 2)
length = input.int(20, minval=1)
src = input(close, title="Source")
mult = input.float(2.0, minval=0.001, maxval=50, title="StdDev")
basis = ta.sma(src, length)
dev = mult * ta.stdev(src, length)
upper = basis + dev
lower = basis - dev
offset = input.int(0, "Offset", minval = -500, maxval = 500)

//fill(p1, p2, title = "Background", color=color.rgb(33, 150, 243, 95))
lowerthanlowerband = false
higherthanupperband = false
atupperband = false


//p2 = plot(lower, "Lower", color=#2962FF, offset = offset)

if(close < lower)
    lowerthanlowerband := true
    
if(close > upper)
    higherthanupperband := true

if(close == upper)
    atupperband := true
    

//PSAR SECTION


start = input(0.02)
increment = input(0.02)
maximum = input(0.2, "Max Value")
out = ta.sar(start, increment, maximum)

parabolicsell1 = false
parabolicsell2 = false
parabolicsell3 = false
parabolicsell4 = false
parabolicsell5 = false

parabolicbuy1 = false
parabolicbuy2 = false
parabolicbuy3 = false
parabolicbuy4 = false
parabolicbuy5 = false


totalNumOfBars = bar_index
firstBar = bar_index[1]
secondBar = bar_index[2]
thirdBar = bar_index[3]
fourthBar = bar_index[4]
fifthBar = bar_index[5]

//sell conditions

if(out > firstBar)
    parabolicsell1 := true

if(out > secondBar)
    parabolicsell2 := true
    
if(out > thirdBar)
    parabolicsell3 := true
    
if(out > fourthBar)
    parabolicsell4 := true
    
if(out > fifthBar)
    parabolicsell5 := true
    
//buy conditions

if(out < firstBar)
    parabolicbuy1 := true
    
if(out < secondBar)
    parabolicbuy2 := true
    
if(out < thirdBar)
    parabolicbuy3 := true
    
if(out < fourthBar)
    parabolicbuy4 := true
    
if(out < fifthBar)
    parabolicbuy5 := true
    
//bgcolor(parabolicsell1 ? color.red : na)

//STOCHASTIC SECTION


//indicator(title="Stochastic", shorttitle="Stoch", format=format.price, precision=2, timeframe="", timeframe_gaps=true)
periodK = input.int(14, title="%K Length", minval=1)
smoothK = input.int(1, title="%K Smoothing", minval=1)
periodD = input.int(3, title="%D Smoothing", minval=1)
k = ta.sma(ta.stoch(close, high, low, periodK), smoothK)
d = ta.sma(k, periodD)

stochasticbuy = false
stochasticsell = false

if(k >= 65)
    stochasticsell := true

if(d >= 65)
    stochasticsell := true
    
if(k <= 25)
    stochasticbuy := true
    
if(d <= 25)
    stochasticbuy := true
  



float TOTALBUYSCORE = 0
float TOTALSELLSCORE = 0

if(lowerthanlowerband == true)
    TOTALBUYSCORE := TOTALBUYSCORE + 1

if(stochasticbuy == true)
    TOTALBUYSCORE := TOTALBUYSCORE + 1
    
if(parabolicbuy1 == true)
    TOTALBUYSCORE := TOTALBUYSCORE + 0.3
    
if(parabolicbuy2 == true)
    TOTALBUYSCORE := TOTALBUYSCORE + 0.3
    
if(parabolicbuy3 == true)
    TOTALBUYSCORE := TOTALBUYSCORE + 0.3
    
if(parabolicbuy4 == true)
    TOTALBUYSCORE := TOTALBUYSCORE + 0.3
    
if(parabolicbuy5 == true)
    TOTALBUYSCORE := TOTALBUYSCORE + 0.3
    
    
//TOTALSELLSCORE

if(higherthanupperband == true)
    TOTALSELLSCORE := TOTALSELLSCORE + 1

if(atupperband == true)
    TOTALSELLSCORE := TOTALSELLSCORE + 1
    
if(stochasticsell == true)
    TOTALSELLSCORE := TOTALSELLSCORE + 1
    
if(parabolicsell2 == true)
    TOTALSELLSCORE := TOTALSELLSCORE + 0.3
    
    
if(parabolicsell3 == true)
    TOTALSELLSCORE := TOTALSELLSCORE + 0.3

    
if(parabolicsell4 == true)
    TOTALSELLSCORE := TOTALSELLSCORE + 0.3
    
    
if(parabolicsell5 == true)
    TOTALSELLSCORE := TOTALSELLSCORE + 0.3

BOOLSELL = false
BOOLBUY = false

if(TOTALSELLSCORE > TOTALBUYSCORE)
    BOOLSELL := true

if(TOTALBUYSCORE > TOTALSELLSCORE)
    BOOLBUY := true
    30, 125, 74
    223, 101, 25
    
bgcolor(BOOLSELL ? color.rgb(223, 101, 25) : na)
bgcolor(BOOLBUY ? color.rgb(30, 125, 74) : na)
