


add 'draw X'

auto-sort hand

add 'removed from game' pile

add 'swap discard/draw' button


add (multi) button to draw up to hand size
remove outline on 'removed' pile
update graphics for hand to make space for pile

Document diffs from release version for easy merging

add notifications for new actions
	
add aura(1,2)-set/unset hotkey

symbols aura



Add/Modify zones: 
	HandDrop(151,469) 
	Removed(712,340 887,340 887,600 712,600) 
	TempPile1(949,0) 
	XHand(0,644 700,644 700,318 0,318)

Update card prototype:	
	Add new zones to permitted location list: Check Card Legal Card Move
		HandDrop 
		Removed 
		TempPile1
	Remove 'does not stack' trait from cards
	Send to location (SendHandCardsAside): X_SendHandAside, X_ReturnHand, Zone on selected map(Player X's Cards, XTempPile1)
Flip controls: 
	X_SendToTemp1(Player X Temp Pile 1)
	X_SendToTemp2(Player X Temp Pile 2)
	X_SendToFate(Player X Fate Deck)
	X_SendToDiscard(Player X Discard Pile)
	Draw Card(X_DrawCard): Zone on selected map(Player X's Cards, {"XHandDrop"})
Add generic counter: track CurrentCount local parameter
	Layer - Counter: Always active, Levels follow expression(CurrentCount, level 1 = 0)
Pass token counter - remove SS incrementer, change trigger name to PT_plus/minus, global SS: remove incrementer call, change trigger to PT_plus/minus, change gears triggers, add dynamic property
Rework SS counter - convert to use generic count
Add Swap Deck and Discard button: X_Swap_Fate_Discard,{PlayerSide==X_Name}, Counters on this map only, Swap Deck and Discard
add art assets for cards board background
Add deck counter pieces: fate deck count(206,304), discard pile count(896,296), removed pile count(896,592)
	Prototype - GenericCounter
	Calculated Property - CurrentCount(GetProperty("Player X Fate Deck_numPieces")
	Does not stack(shift to select, move when selected)
	Delete(Delete, DeleteCounter)
Add decks: 
	removed pile(Side board, (800,470,175,260),Allow specific cards($BasicName$),facedown(never),Re-shuffle(never), max stack display(10)
	temp pile 1 (Side board, (949,0,0,0), facedown(never), reshuffle(never), max stack(10)
	temp pile 2 (Side board, (1,643,1,1), facedown(never), reshuffle(never), max stack(10)
Swap_Deck_Discard control: 
	X_Swap_Fate_Discard: SendToTemp1, SendToFate, SendToTemp2, SendToDiscard
	Global key commands: 
		X_SendToTemp1(DeckName = Player X Fate Deck, all pieces) 
		X_SendToFate(DeckName = Player X Discard Pile, all), 
		X_SendToTemp2(DeckName = Player X Temp Pile 1, all), 
		X_SendToDiscard(DeckName = Player X Temp Pile 2, all)
	Report Action: X_Swap_Fate_Discard($X_Name$ Deck and discard have been swapped)
	Does not stack
Draw button: Put into new at-start stack (115, 333)
	Basic piece(drawHandButton.png)
	Global key command (DrawCard: X_DrawCard)(CurrentMap = Player X's Cards && DeckName = Player X Fate Deck)
	Dynamic property - HandCardsCount: Numeric(0:54), SetHandCount, set directly, {GetProperty("Player X Temp Pile 1_numPieces")}
	Trigger - Update hand count: P1_UpdateHandCount(SendHandAside, SetHandCount, SendToTemp2, ReturnHand)
	Global key commands: 
		SendHandAside(X_SendHandAside, CurrentZone = XHand, all)
		SendToTemp2(X_SendToTemp2, DeckName = Player X Temp Pile 1, all)
		ReturnHand(X_ReturnHand, DeckName = Player X Temp Pile 2, all)
	Action Button - Draw to 6: X_DrawTo6 (-42,-10,85,20)
	Trigger Action - Draw to 7: X_DrawTo7(DrawCard, repeat while({7-HandCardsCount>=i7}), P1_UpdateHandCount, (i7,1,1)
	Trigger Action - Draw to 6: X_DrawTo6(DrawCard, repeat while({6-HandCardsCount>=i5}), P1_UpdateHandCount, (i6,1,1)
	Trigger Action - Draw to 5: X_DrawTo5(DrawCard, repeat while({5-HandCardsCount>=i5}), P1_UpdateHandCount, (i5,1,1)
	Restricted Commands,hide ({PlayerSide!=X_Name})
		X_DrawTo5
		X_DrawTo6
		X_DrawTo7
	Does not stack(never select, never move)
		
Stacking options: (50,0,12,-2)
	






{GetProperty("Player One Fate Deck_numPieces")}

ss_plus, ss_minus - set global counter
next_SS, previous_SS - update graphic

increase_p1_SS

712,40 887,40 887,300 712,300

0,644 700,644 700,318 0,318

712,340 887,340 887,600 712,600


C:\Users\Andoroth\Downloads\M3E-Malifaux-v1g_andorman.vmod


P1_handCards

P1_clearHandCount
P1_incrementHandCount
P1_updateHandCount
	
P1_SendHandAside
P1_SendHandBack

Send to Location
sendAside
P1_SendHandAside
sendBack
P1_SendHandBack
Zone on selectedMap
Map: Player One's Cards
Zone Name: P1MoveAside


Trigger Action
{CurrentZone == "P1Hand"}
P1_updateHandCount
P1_SendHandAside
P1_incrementHandCount
loop:
while: {CurrentZone == "P1Hand"}
P1_clearHandCount
P1_returnHand

{CurrentZone == "P1MoveAside"}
P1_returnHand
P1_SendHandBack
loop for {P1_handCards}

P1TempDeck1

global key command: 
	SendHandAside
	P1_sendHandAside
	CurrentZone = "P1Hand"
	All pieces in deck
P1_setHandCount
global key command: 
	ReturnHand
	P1_returnHand
	DeckName = Player One Temp Pile1
	All pieces in deck
	
P1_reverseTemp1Deck


Add P2TempDeck1 zone
Create Draw Cards control
Add P2_handCards global property
Add p2HandDrop zone
Add p2HandDrop to permitted locations
Add 'P2_DrawCard'




	
