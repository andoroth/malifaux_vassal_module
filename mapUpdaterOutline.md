

	
get folder of maps to update, module to update for, folder to export into
generate module slot map

for each saved map:
load in game state from saved map
	final GameState gs = GameModule.getGameModule().getGameState();
	final Command c = new NullCommand();
	
	gs.setup(false, true);
    gs.loadGameInBackground(savedGame);
    while (!gs.isGameStarted()) {
      try {
        Thread.sleep(100);
      }
      catch (InterruptedException e) {
      }
    }

get game pieces
    GamePiece[] gp_array = gs.getAllPieces().toArray(new GamePiece[0]);

for each piece:	
	get piece type
	get slotID for piece
		String slotId = pieceSlot.getProperty(p.getType());
	if slotId !null, continue
	else, show error
		
	check if slot is terrain
		third entry of 'slotId' == VASSAL.build.widget.PanelWidget:Terrain
	
	gamepieceInstance = GameModule.getGameModule().createPiece(piece.getType())
	
	if it is, append 'addPiece(piece)' command to list
		
	c.append(new AddPiece(piece, state))
		

close map
open new map
execute command
	c.execute()
save game to output folder


	
VASSAL.build.module.PieceWindow:Everything/VASSAL.build.widget.TabWidget:Items/VASSAL.build.widget.PanelWidget:Terrain/VASSAL.build.widget.BoxWidget:Terrain [New]/VASSAL.build.widget.PanelWidget:Terrain Markers/VASSAL.build.widget.ListWidget:Terrain Markers/VASSAL.build.widget.PieceSlot:Hazardous

"Bayou_blues.vsav" "Bidonville.vsav" "Cactus_Fields.vsav" "Crumbled_Temple.vsav" "Desert_Oasis.vsav" "Desolate_Wasteland.vsav" "Easten_Hill.vsav" "End_of_the_Line.vsav" "Floodlands.vsav" "Forest_of_the_Loom.vsav" "Forest_Ruins.vsav" "Forests_Edge.vsav" "Grasslands.vsav" "High_Ground.vsav" "Industry.vsav" "Lava_Lakes.vsav" "Mausoleam.vsav" "Misty_Hills.vsav" "Northen_Path_fixed.vsav" "Occulus.vsav" "Prison_Break.vsav" "Quarantine_Zone.vsav" "Rivierra.vsav" "Southen_Hills.vsav" "The_Village.vsav" "Trading_Stop.vsav" "Water_Works.vsav" "Welcome_to_the_Jungle.vsav" "Westen_Tracks.vsav" "Woodland_Lake.vsav"


test context - hijack updater tool





piece type is index into hash table linking piece types to the path to their piece in componentPathBuilder
piece type - all information static during course of the game
slotId: path to the piece in the piece library

gets the piece from the component library, uses it to replace the original

matchTraits - copies the state from original piece to the new clone

How do I build the mapping to the component path
	iterate through every configurable element in the game module
	Check if it's a piece slot
	If it is, generate a unique ID from the path through the parent-child tree to reach the component
	Map the pieceType key to the slotID path

How do I create the piece
	convert ID back to path
	check that final item in path is in fact a pieceSlot
	create the new piece
	
For current module, find all 'pieceSlots'
for all 
get inner piece associated with them



	
	


get folder of maps to update, module to update for, folder to export into
generate module slot map

for each saved map:

load in game state from saved map
get game pieces
build hash table from all pieces, Value: path to component, Key: piece type

for each piece:

retrieve ID from hashtable using piece type
Test ID to determine if it's terrain
get piece state
create clone of the reference piece
add the cloned piece with state of original terrain piece to command queue

open new map
run command
save map











