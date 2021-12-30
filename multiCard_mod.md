Drop all 'send to deck' calls - convert to 'send to location' calls, which send to 'zone on map'
	Map and player name are set in parameters, all references to them reference the local parameter
	
Decks, zones, flip calls lose PX qualifiers
	No commands should have PX in the name - only map and final card prototypes defining mask images

Add label to maps indicating the owner's ID


Decks only need to be unique at the map level - duplicates across maps appears to be fine



Needed art updates:
	Card board background
	Card back
	Card mask
	
	

move deck to 'location'
move discard to draw
move 'location' to discard
reverse discard

add 'count card' property to each card
To count cards in zone X, just reset the card counter, and have each card in zone X call 'count card', and read off the result


set 'n' to draw up to
call draw to 'n' action



Player specific components
	player name, side, ID
	Player map
	Player X card - adds exactly the mask feature with 
	
	
	
card
flips
reports


27,40 203,40 203,300 27,300
115,170
175,260

712,40 888,40 888,300 712,300
800,170


100,140
100 wide
	
	
	Fix 'spendSS' button

	Delete old 'draw cards', move new 'draw cards'
	Copy 'controls' into boards P2-P8
	Correct 'set owner' commands p2-p8

Fix reports/come up with reportable event types
		Shuffle deck - player board command
		Re-Shuffle deck - player board command
		Swap deck/discard - player board
		Draw to (X) - player board
		Other *playerId* manipulated *ownerId* card - condition trigger
		Return to bottom of fate - report card command
		Return to bottom of discard - report card command
		Card flipped - report card command
	Draw card from fate - condition trigger
	Draw card from discard - condition trigger
	Card from removed - condition trigger
	Card to top of fate deck - condition trigger
		check 'to bottom' flag unset
	Card to top of discard - condition trigger
		check 'to bottom' flag unset
	Card to removed - condition trigger
	
Set 'Owning_Player' to 'null' or something to avoid startup bug

Set up deck/piece/token system for adding the all out brawl event



