import random

deck=[[['A','spade'],'1'],[['2','spade'],'2'],[['3','spade'],'3'],[['4','spade'],'4'],[['5','spade'],'5'],[['6','spade'],'6'],[['7','spade'],'7'],[['8','spade'],'8'],[['9','spade'],'9'],[['10','spade'],'10'],[['J','spade'],'10'],[['Q','spade'],'10'],[['K','spade'],'10'],[['A','heart'],'1'],[['2','heart'],'2'],[['3','heart'],'3'],[['4','heart'],'4'],[['5','heart'],'5'],[['6','heart'],'6'],[['7','heart'],'7'],[['8','heart'],'8'],[['9','heart'],'9'],[['10','heart'],'10'],[['J','heart'],'10'],[['Q','heart'],'10'],[['K','heart'],'10'],[['A','diamond'],'1'],[['2','diamond'],'2'],[['3','diamond'],'3'],[['4','diamond'],'4'],[['5','diamond'],'5'],[['6','diamond'],'6'],[['7','diamond'],'7'],[['8','diamond'],'8'],[['9','diamond'],'9'],[['10','diamond'],'10'],[['J','diamond'],'10'],[['Q','diamond'],'10'],[['K','diamond'],'10'],[['A','club'],'1'],[['2','club'],'2'],[['3','club'],'3'],[['4','club'],'4'],[['5','club'],'5'],[['6','club'],'6'],[['7','club'],'7'],[['8','club'],'8'],[['9','club'],'9'],[['10','club'],'10'],[['J','club'],'10'],[['Q','club'],'10'],[['K','club'],'10']]

hand_player=[]
hand_dealer=[]
up_card=[]
hole_card=[]
sum_player=[0,10]
sum_dealer=[0,10,0,10]
blackjack_player=0
blackjack_dealer=0
ace_player=0
ace_dealer=0
busted_player=0
busted_dealer=0

print('BLACKJACK')
print('----------------------------')
print('| SINGLE DECK BLACKJACK    |')
print('| NO DOUBLE                |')
print('| NO SPLIT                 |')
print('| NO INSURANCE             |')
print('| NO EVEN MONEY            |')
print('| NO SURRENDER             |')
print('| DEALER MUST HIT SOFT 17  |')
print('----------------------------')

print('----------------------------')
print('PLAYER')
for i in range(0,2):
    j=random.randint(0,len(deck)-1)
    hand_player.append(deck[j])
    del deck[j]
    sum_player[0]+=int(hand_player[i][1])
    sum_player[1]+=int(hand_player[i][1])
for i in range(0,len(hand_player)):
    print(hand_player[i][0])
if ((hand_player[0][0][0]=='A')or(hand_player[1][0][0]=='A'))and(sum_player[1]==21):
    print('TOTAL:'+str(sum_player[0]),'or',str(sum_player[1]),': BLACKJACK!')
    blackjack_player=1
    ace_player=1
elif ((hand_player[0][0][0]=='A')or(hand_player[1][0][0]=='A'))and(sum_player[1]<21):
    print('TOTAL:'+str(sum_player[0]),'or',str(sum_player[1]))
    ace_player=1
else:
    print('TOTAL:'+str(sum_player[0]))
print('----------------------------')

print('----------------------------')
print('DEALER')
for i in range(0,2):
    j=random.randint(0,len(deck)-1)
    hand_dealer.append(deck[j])
    if i==0:
        up_card.append(deck[j])
    else:
        hole_card.append(deck[j])
    del deck[j]
    sum_dealer[0]+=int(hand_dealer[i][1])
    sum_dealer[1]+=int(hand_dealer[i][1])
sum_dealer[2]+=int(up_card[0][1])
sum_dealer[3]+=int(up_card[0][1])
print(up_card[0][0],': UP CARD')
if up_card[0][0][0]=='A':
    print('TOTAL:'+str(sum_dealer[2]),'or',str(sum_dealer[3]))
    ace_dealer=1
else:
    print('TOTAL:'+str(sum_dealer[2]))
if hole_card[0][0][0]=='A':
    ace_dealer=1
print('----------------------------')

while 1>0:
    if blackjack_player==1:
        break
    print('----------------------------')
    print('PLAYER')
    val=input('1:HIT or 2:STAND : ')
    if (int(val)==1):
        print('1:HIT')
        for i in range(0,1):
            j=random.randint(0,len(deck)-1)
            hand_player.append(deck[j])
            print(deck[j][0])
            sum_player[0]+=int(deck[j][1])
            sum_player[1]+=int(deck[j][1])
            if deck[j][0][0]=='A':
                ace_player=1
            del deck[j]
            if (ace_player==1)and(sum_player[1]<=21):
                print('TOTAL:'+str(sum_player[0]),'or',str(sum_player[1]))
            elif (ace_player==1)and(sum_player[0]<=21)and(sum_player[1]>21):
                print('TOTAL:'+str(sum_player[0]))
            elif (ace_player==0)and(sum_player[0]<=21):
                print('TOTAL:'+str(sum_player[0]))
            elif sum_player[0]>21:
                print('TOTAL:'+str(sum_player[0]),': BUSTED')
                busted_player=1
        if busted_player==0:
            print('----------------------------')
            continue
        elif busted_player==1:
            print('----------------------------')
            break
    elif int(val)==2:
        print('2:STAND')
        if blackjack_player==1:
            print('TOTAL:'+str(sum_player[0]),'or',str(sum_player[1]),': BLACKJACK!')
        elif (ace_player==1)and(sum_player[1]<=21):
            print('TOTAL:'+str(sum_player[0]),'or',str(sum_player[1]))
        elif (ace_player==1)and(sum_player[0]<=21)and(sum_player[1]>21):
             print('TOTAL:'+str(sum_player[0]))
        elif (ace_player==0)and(sum_player[0]<=21):
             print('TOTAL:'+str(sum_player[0]))
        print('----------------------------')
        break
    else:
        print('----------------------------')
        continue

print('----------------------------')
print('PLAYER')
for i in range(0,len(hand_player)):
    print(hand_player[i][0])
if blackjack_player==1:
    print('TOTAL:'+str(sum_player[0]),'or',str(sum_player[1]),': BLACKJACK!')
    total_player=sum_player[1]
elif (ace_player==1)and(sum_player[1]<=21):
    print('TOTAL:'+str(sum_player[0]),'or',str(sum_player[1]))
    total_player=sum_player[1]
elif (ace_player==1)and(sum_player[0]<=21)and(sum_player[1]>21):
    print('TOTAL:'+str(sum_player[0]))
    total_player=sum_player[0]
elif (ace_player==0)and(sum_player[0]<=21):
    print('TOTAL:'+str(sum_player[0]))
    total_player=sum_player[0]
elif sum_player[0]>21:
    print('TOTAL:'+str(sum_player[0]),': BUSTED')
    total_player=sum_player[0]
    busted_player=1
print('----------------------------')

print('----------------------------')
print('DEALER')
print(up_card[0][0],': UP CARD')
print(hole_card[0][0],': HOLE CARD')
if (ace_dealer==1)and(sum_dealer[1]==21):
    print('TOTAL:'+str(sum_dealer[0]),'or',str(sum_dealer[1]),': BLACKJACK!')
    total_dealer=sum_dealer[1]
    blackjack_dealer=1
else:
    for i in range(0,len(deck)):
        if (sum_dealer[0]>=17)or((ace_dealer==1)and(sum_dealer[1]>17)and(sum_dealer[1]<=21)):
            break
        j=random.randint(0,len(deck)-1)
        hand_dealer.append(deck[j])
        del deck[j]
        sum_dealer[0]+=int(hand_dealer[i+2][1])
        sum_dealer[1]+=int(hand_dealer[i+2][1])
        if hand_dealer[i+2][0][0]=='A':
            ace_dealer=1
    for i in range(2,len(hand_dealer)):
        print(hand_dealer[i][0])
    if (ace_dealer==1)and(sum_dealer[1]<=21):
        print('TOTAL:'+str(sum_dealer[0]),'or',str(sum_dealer[1]))
        total_dealer=sum_dealer[1]
    elif (ace_dealer==1)and(sum_dealer[0]<=21)and(sum_dealer[1]>21):
        print('TOTAL:'+str(sum_dealer[0]))
        total_dealer=sum_dealer[0]
    elif (ace_dealer==0)and(sum_dealer[0]<=21):
         print('TOTAL:'+str(sum_dealer[0]))
         total_dealer=sum_dealer[0]
    elif sum_dealer[0]>21:
        print('TOTAL:'+str(sum_dealer[0]),': BUSTED')
        total_dealer=sum_dealer[0]
        busted_dealer=1
print('----------------------------')

print('----------------------------')
print('RESULT')
if (blackjack_player==1)and(blackjack_dealer==1):
    print('DROW')
elif (blackjack_player==1)and(blackjack_dealer==0)and(total_dealer==21):
    print('WIN')
elif (blackjack_player==1)and(blackjack_dealer==0)and(total_dealer<21):
    print('WIN')
elif (blackjack_player==1)and(blackjack_dealer==0)and(busted_dealer==1):
    print('WIN')
elif (blackjack_player==0)and(total_player==21)and(blackjack_dealer==1):
    print('LOSE')
elif (blackjack_player==0)and(total_player==21)and(blackjack_dealer==0)and(total_dealer==21):
    print('DROW')
elif (blackjack_player==0)and(total_player==21)and(total_dealer<21):
    print('WIN')
elif (blackjack_player==0)and(total_player==21)and(busted_dealer==1):
    print('WIN')
elif (total_player<21)and(blackjack_dealer==1):
    print('LOSE')
elif (total_player<21)and(blackjack_dealer==0)and(total_dealer==21):
    print('LOSE')
elif (total_player<21)and(total_dealer<21)and(total_player>total_dealer):
    print('WIN')
elif (total_player<21)and(total_dealer<21)and(total_player<total_dealer):
    print('LOSE')
elif (total_player<21)and(total_dealer<21)and(total_player==total_dealer):
    print('DROW')
elif (total_player<21)and(busted_dealer==1):
    print('WIN')
elif busted_player==1:
    print('LOSE')
print('----------------------------')