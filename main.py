import datetime
import os
import pyautogui
import time

nasdaq100=['activision', 'adobe', 'alphabet','amazon','amd','apple','asml','atlassian','ansys','booking','broadcom','costco','dexcom','dollar tree','ebay','honeywell','intel','intuit','illumina','intuitive','kla-tencor','lam research','lululemon','mercadolibre','microsoft','moderna','netflix','nvidia','nxp semiconductors','paypal','qualcomm','regeneron','starbucks','texas','t-mobile us','verisign','verisk','vertex pharma','gilead','micron','applied','charter','amgen','pepsi']
ftse100=['evraz','shell plc ord eu', 'hsba','ulvr','dge','glaxosmithkline 25p','bats','bp plc', 'rio tinto ord 10p', 'glen', 'anglo american usd0', 'reckitt', 'rel', 'national grid 12', 'vod', 'lloy', 'lseg', 'prudential 5p', 'barclays', 'compass ord 11', 'experian', 'natwest', 'crh eur 0', 'ferguson 10p', 'ashtead', 'bae 2', 'bt.a', 'sse 50p', 'lgen', 'stan', 'imb', 'av.', 'abf', 'sgro', 'smt', 'anto', '3i 73', 'wpp', 'sn.', 'ocdo', 'crda','entain','bunzl','rentokil','informa 0.', 'admiral', 'rr.']
nyse = ['3m', 'axp', 'ba', 'cat', 'cvx','ko','dow','gs','hd','jnj','jpm','mcd','merck','nke','pg','trv','unh','vz','v','']
dax = ['dpw','sie','vow3','mbg','fre','con','dte','alv','bmw','bas','bayn','sap','dbk','enr','linde plc eo 0','hei','hen3','eoan','ifx','rwe','1cov', 'db1']
#cant access azn
i = 1
imagecounter = 0

left = 1238
right = 1365
bottom = 495
top = 199

time.sleep(10)


now = datetime.datetime.now()

ukandgermanmarketopeningtime = now.replace(hour=8, minute=0, second=0,microsecond=0)
ukandgermanmarketclosingtime = now.replace(hour=16, minute=30, second=0, microsecond=0)

americanmarketopeningtime = now.replace(hour=14, minute=30, second=0, microsecond=0)
americanmarketclosingtime = now.replace(hour=21, minute=0, second=0, microsecond=0)


#will use if now == uk... and if now == american... or if now > uk... and if now > american...

# typing in stock names to tradingview
# first we start with the ftse100


pyautogui.click(132, 176)  # clicks the search bar
for x1 in ftse100:
 #x is the stock itself
 #print(x1)
 #for y1 in x1:
 #pyautogui.press(y1)  # puts in name
 pyautogui.write(x1)
 pyautogui.click(519, 450)  # clicks on chart
 time.sleep(3)


 t0=time.time()
 i+=1
 imagecounter+=1
 s=pyautogui.screenshot(region=(left,top,right,bottom))
 s.save(r'C:\Users\eyesi\OneDrive\Desktop\stockscreenpictures\pic' +str(imagecounter) +'.png')
 t1=time.time()
 total=t1-t0
 print(total)
 time.sleep(1)

 buysignalcolor = (30,125,74)
 sellsignalcolor = (223,101,25)
 for x in range(s.width):
  for y in range(s.height):
   if s.getpixel((x,y)) == buysignalcolor:
    buy = True
    sell = False
   if s.getpixel((x, y)) == sellsignalcolor:
    #going to get it to write to a word document later
    sell = True
    buy = False
    if buy == True:
     print(x1)
     print("BUY")
    if sell == True:
     print(x1)
     print("SELL")
    sell = False
    buy = False
 os.remove(r'C:\Users\eyesi\OneDrive\Desktop\stockscreenpictures\pic' +str(imagecounter) +'.png')
