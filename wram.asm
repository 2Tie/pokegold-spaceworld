INCLUDE "constants.asm"


SECTION "Music engine RAM", WRAM0[$C000]

wMusic:: ; c000

wChannels::
wChannel1:: channel_struct wChannel1 ; c000
wChannel2:: channel_struct wChannel2 ; c032
wChannel3:: channel_struct wChannel3 ; c064
wChannel4:: channel_struct wChannel4 ; c096

wSFXChannels::
wChannel5:: channel_struct wChannel5 ; c0c8
wChannel6:: channel_struct wChannel6 ; c0fa
wChannel7:: channel_struct wChannel7 ; c12c
wChannel8:: channel_struct wChannel8 ; c15e

    ds 1 ; c190

wCurTrackDuty:: db ; c191
wCurTrackIntensity:: db ; c192
wCurTrackFrequency:: dw ; c193
wc195:: db ; c195

	ds 2 ; TODO

wCurChannel:: db ; c198
wVolume:: db ; c199
wSoundOutput:: ; c19a
; corresponds to $ff25
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	db

    ds 1 ; TODO

wMusicID:: dw ; c19c
wMusicBank:: db ; c19e

	ds 5 ; TODO

wLowHealthAlarm:: ; c1a4
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	db

wMusicFade:: ; c1a5
; fades volume over x frames
; bit 7: fade in/out
; bit 0-6: number of frames for each volume level
; $00 = none (default)
	db
wMusicFadeCount:: db ; c1a6
wMusicFadeID:: dw ; c1a7

    ds 2 ; TODO

wIncrementTempo: dw ; c1ab
wMapMusic:: db ; c1ad
wCryPitch:: dw ; c1ae
wCryLength:: dw ; c1b0

    ds 10 ; TODO

; either wChannelsEnd or wMusicEnd, unsure
wMusicInitEnd:: ; c1bc


SECTION "OAM buffer", WRAM0[$C200]

wVirtualOAM:: ; c200
    ds SPRITEOAMSTRUCT_LENGTH * NUM_SPRITE_OAM_STRUCTS
wVirtualOAMEnd::

wTileMap:: ; c2a0
    ds SCREEN_HEIGHT * SCREEN_WIDTH

UNION

wTileMapBackup:: ; c408
    ds SCREEN_HEIGHT * SCREEN_WIDTH

NEXTU

    ds 3

; Monster or Trainer test?
wWhichPicTest:: ; c40b
    db

ENDU


SECTION "Unknown map buffer?", WRAM0[$C5E8]

; TODO: this is probably not related to the map script. Figure out what it actually is
wUnknownIdC5E8:: ; c5e8
    db

wUnknownIdC5E8Location::
    dw ; c5e9 ; TODO

wUnknownMapPointer::
    dw ; c5eb ; TODO

    ds 19 ; TODO
wUnknownMapBufferEnd:: ; c600


UNION

wOverworldMapBlocks:: ; c600
    ds $514 ; TODO: constantify this
wOverworldMapBlocksEnd:: ; cb14

NEXTU

wLYOverrides:: ; c600
    ds SCREEN_HEIGHT_PX

NEXTU

	ds $422 ; TODO

wTrainerClass:: ; ca22
	db

ENDU


SECTION "CB14", WRAM0[$CB14]

UNION
wRedrawRowOrColumnSrcTiles:: ; cb14
; the tiles of the row or column to be redrawn by RedrawRowOrColumn
    ds SCREEN_WIDTH * 2
NEXTU
wRedrawFlashlightDst0:: dw ; cb14
wRedrawFlashlightSrc0:: dw ; cb16
wRedrawFlashlightBlackDst0:: dw ; cb18
wRedrawFlashlightDst1:: dw ; cb1a
wRedrawFlashlightSrc1:: dw ; cb1c
wRedrawFlashlightBlackDst1:: dw ; cb1e
wRedrawFlashlightWidthHeight:: db ; cb20
; width or height of flashlight redraw region
; in units of two tiles (people event meta tile)
ENDU

SECTION "CB56", WRAM0[$CB5B]
wcb5b:: ds 1         ; multipurpose, also wName, wMonDexIndex2
wNameCategory:: ds 1

SECTION "CB62", WRAM0[$CB62]

wVBCopySize:: ds 1 ; cb62
wVBCopySrc:: ds 2 ; cb63
wVBCopyDst:: ds 2 ; cb65
wVBCopyDoubleSize:: ds 1 ; cb67
wVBCopyDoubleSrc:: ds 2 ; cb68
wVBCopyDoubleDst:: ds 2 ; cb6a

SECTION "CB71", WRAM0[$CB71]

wVBCopyFarSize:: ds 1 ; cb71
wVBCopyFarSrc:: ds 2 ; cb72
wVBCopyFarDst:: ds 2 ; cb74
wVBCopyFarSrcBank:: ds 1 ; cb76

SECTION "Collision buffer", WRAM0[$CB90]

wTileDown::  db ; cb90
wTileUp::    db ; cb91
wTileLeft::  db ; cb92
wTileRight:: db ; cb93

SECTION "CBD2", WRAM0[$CBD2]
wcbd2:: ; cbd2
    ds $14

SECTION "CBF7", WRAM0[$CBF7]

wWhichIndexSet::
wActiveBackpackPocket:: db ; cbf7

SECTION "CC09", WRAM0[$CC09]

wMenuCursorBuffer:: db ; cc09

SECTION "CC2A", WRAM0[$CC2A]

wMenuCursorY:: db ; cc2a

SECTION "CC32", WRAM0[$CC32] ; Please merge when more is disassembled
wVBlankJoyFrameCounter: db ; cc32

wVBlankOccurred: db ; cc33

    ds 4

wcc38:: ; cc38 ; TODO: wceeb in pokegold, what is this?
    db

wDebugWarpSelection:: ; cc39
    db

    ds 6

wSGB:: ; cc40
    db

SECTION "CC9C", WRAM0[$CC9C]

wUnknownWordCC9C:: ; cc9c
    dw

wUnknownBufferCC9E:: ; cc9e
    ds 14


wSpriteCurPosX          : ds 1 ; ccac
wSpriteCurPosY          : ds 1 ; ccad
wSpriteWidth            : ds 1 ; ccae
wSpriteHeight           : ds 1 ; ccaf
wSpriteInputCurByte     : ds 1 ; ccb0
wSpriteInputBitCounter  : ds 1 ; ccb1
wSpriteOutputBitOffset  : ds 1 ; ccb2
wSpriteLoadFlags        : ds 1 ; ccb3
wSpriteUnpackMode       : ds 1 ; ccb4
wSpriteFlipped          : ds 1 ; ccb5
wSpriteInputPtr         : ds 2 ; ccb6
wSpriteOutputPtr        : ds 2 ; ccb8
wSpriteOutputPtrCached  : ds 2 ; ccba
wSpriteDecodeTable0Ptr  : ds 2 ; ccbc
wSpriteDecodeTable1Ptr  : ds 2 ; ccbe

SECTION "CCC7", WRAM0[$CCC7]

wDisableVBlankOAMUpdate:: db ; ccc7

SECTION "CCCA", WRAM0[$CCCA]

wBGP:: db ; ccca
wOBP0:: db ; cccb
wOBP1:: db ; cccc

SECTION "CCCE", WRAM0[$CCCE]

wDisableVBlankWYUpdate:: db ; ccce

SECTION "CD26", WRAM0[$CD26]

wcd26:: ; cd26
    db

SECTION "CD31", WRAM0[$CD31]

wcd31:: ; cd31
    db

SECTION "CD3E", WRAM0[$CD3D]

wRegularItemsCursor:: db ; cd3d
wBackpackAndKeyItemsCursor:: db ;cd3e
wStartmenuCursor:: db ; cd3f
    ds 4 ; TODO
wRegularItemsScrollPosition:: db ; cd44
wBackpackAndKeyItemsScrollPosition:: db ; cd45
    ds 3 ; TODO
wMenuScrollPosition:: db ; cd49

wTextDest:: ds 2; cd4a

StartmenuCloseAndSelectHookBank:: db ; cd4c
StartmenuCloseAndSelectHookPtr:: dw ; cd4d

wPredefID:: ; cd4f
    db

wPredefHL:: ; cd50
    dw
wPredefDE:: ; cd52
    dw
wPredefBC:: ; cd54

wFarCallBCBuffer:: ; cd54
    dw

SECTION "CD76", WRAM0[$CD76]

wcd76:: ; cd76
    db

wcd77:: ;cd77
    db

wMonDexIndex: ds 1 ; cd78

SECTION "CD7D", WRAM0[$CD7D]

wItemQuantity:: ; cd7d
    db

SECTION "CDBD", WRAM0[$CDBD]

wLinkMode:: db ; cdbd
; 00 - 
; 01 - 
; 02 - 
; 03 -  

wTargetMapUnk:: db ; cdbe ; TODO: Probably warp ID, check
wTargetMapGroup:: db ; cdbf
wTargetMapId:: db ; cdc0

SECTION "CE00", WRAM0[$CE00]

wBattleMode:: ; ce00
    db

SECTION "CE07", WRAM0[$CE07]

wMonHeader::

wMonHIndex:: ; ce07
; In the ROM base stats data structure, this is the dex number, but it is
; overwritten with the dex number after the header is copied to WRAM.
    ds 1

wMonHBaseStats:: ; ce08
wMonHBaseHP:: ; ce08
    ds 1
wMonHBaseAttack:: ; ce09
    ds 1
wMonHBaseDefense:: ; ce0a
    ds 1
wMonHBaseSpeed:: ; ce0b
    ds 1
wMonHBaseSpecialAtt:: ; ce0c
    ds 1
wMonHBaseSpecialDef:: ; ce0d
    ds 1

wMonHTypes:: ; ce0e
wMonHType1:: ; ce0e
    ds 1
wMonHType2:: ; ce0f
    ds 1

wMonHCatchRate:: ; ce10
    ds 1
wMonHBaseEXP:: ; ce11
    ds 1

wMonHItems:: ; ce12
wMonHItem1:: ; ce12
    ds 1
wMonHItem2:: ; ce13
    ds 1

wMonHGenderRatio:: ; ce14
    ds 1

wMonHUnk0:: ; ce15
    ds 1
wMonHUnk1:: ; ce16
    ds 1
wMonHUnk2:: ; ce17
    ds 1

wMonHSpriteDim:: ; ce18
    ds 1
wMonHFrontSprite:: ; ce19
    ds 2
wMonHBackSprite:: ; ce1b
    ds 2

wMonHGrowthRate:: ; ce1d
    ds 1

wMonHLearnset:: ; ce1e
; bit field
    flag_array 50 + 5
    ds 1

SECTION "CE37", WRAM0[$CE37]

wce37:: ; ce37
    db

SECTION "CE3B", WRAM0[$CE3B]

wVBlankSavedROMBank:: ; ce3b
    db

wBuffer:: ; ce3c
    db

wTimeOfDay:: db ; ce3d
; based on RTC
; Time of Day   Regular    Debug
; 00 - Day      09--15h    00--30s
; 01 - Night    15--06h    30--35s
; 02 - Cave                35--50s
; 03 - Morning  06--09h    50--59s

SECTION "CE5F", WRAM0[$CE5F]

wce5f:: ; ce5f ; TODO
    db

SECTION "CE61", WRAM0[$CE61]

wActiveFrame:: db ; ce61

wTextBoxFlags::  db ; ce62

wce63:: db ; ce63
; 76543210
;       \-- global debug enable


SECTION "CE7F", WRAM0[$CE76]

wObjectFollow_Leader:: ; ce76
    db
wObjectFollow_Follower:: ; ce77
    db


SECTION "Object structs", WRAM0[$CECF]

wObjectStructs:: ; cecf
wPlayerStruct::   object_struct wPlayer
wObject1Struct::  object_struct wObject1
wObject2Struct::  object_struct wObject2
wObject3Struct::  object_struct wObject3
wObject4Struct::  object_struct wObject4
wObject5Struct::  object_struct wObject5
wObject6Struct::  object_struct wObject6
wObject7Struct::  object_struct wObject7
wObjectStructsEnd:: ; d00f

SECTION "Objects", WRAM0[$D04F]

wMapObjects:: ; d04f
wPlayerObject:: map_object wPlayer
wMap1Object::   map_object wMap1
wMap2Object::   map_object wMap2
wMap3Object::   map_object wMap3
wMap4Object::   map_object wMap4
wMap5Object::   map_object wMap5
wMap6Object::   map_object wMap6
wMap7Object::   map_object wMap7
wMap8Object::   map_object wMap8
wMap9Object::   map_object wMap9
wMap10Object::  map_object wMap10
wMap11Object::  map_object wMap11
wMap12Object::  map_object wMap12
wMap13Object::  map_object wMap13
wMap14Object::  map_object wMap14
wMap15Object::  map_object wMap15
wMapObjectsEnd:: ; d14f

	ds 3 ; TODO

wTimeOfDayPal:: db ; d152
; Applied according to wCurTimeOfDay from wTimeOfDayPalset

wd153:: db ; d153
; 76543210
; \-------- switch overworld palettes according to seconds not hours

    ds 3 ; TODO
wTimeOfDayPalFlags:: db ; d157
; 76543210
; \-------- disable overworld palette switch

wTimeOfDayPalset:: db ; d158
; 76543210
; \/\/\/\/
;  | | | \- Map Palette for TimeOfDay 0x00
;  | | \--- Map Palette for TimeOfDay 0x01
;  | \----- Map Palette for TimeOfDay 0x02
;  \------- Map Palette for TimeOfDay 0x03

wCurTimeOfDay:: db ; d159

SECTION "D19E", WRAM0[$D19E]

wNumBagItems:: ; d19e
    db

SECTION "D1C8", WRAM0[$D1C8]

wNumKeyItems:: db ; d1c8

SECTION "D1DE", WRAM0[$D1DE]

wNumBallItems:: db ; d1de


SECTION "D4AB", WRAM0[$D4AB]

wJoypadFlags:: db ; d4ab
; 76543210
; ||||\__/
; ||||  \-- unkn
; |||\----- unkn
; ||\------ don't wait for keypress to close text box
; |\------- joypad sync mtx
; \-------- joypad disabled


SECTION "Warp data", WRAM0[$D514]

wCurrMapWarpCount:: ; d514
    db

wCurrMapWarps:: ; d515
REPT 32 ; TODO: confirm this
    ds 5
ENDR


wCurrMapSignCount:: ; d5b5
    db

wCurrMapSigns:: ; d5b6
REPT 16 ; TODO: confirm this
    ds 4
ENDR

wCurrMapObjectCount:: ; d5f6
    db


SECTION "Used sprites", WRAM0[$D643]

wBGMapAnchor:: ; d643
	dw

wUsedSprites:: ; d645
	dw ; This is for the player
	ds 2 * 5 ; This is for the NPCs
wUsedSpritesEnd:: ; d651


SECTION "Map header", WRAM0[$D658]

wOverworldMapAnchor:: ; d658
	dw

wYCoord:: db ; d65a
wXCoord:: db ; d65b

wMetaTileStandingY:: db ; d65c
wMetaTileStandingX:: db ; d65d

; d65f
	ds 1 ; TODO

wMapPartial:: ; d65f
wMapAttributesBank:: ; d65f
    db
wMapTileset:: ; d660
    db
wMapPermissions:: ; d661
    db
wMapAttributesPtr:: ; d662
    dw
wMapPartialEnd:: ; d664

wMapAttributes:: ; d664
wMapHeight:: ; d664
    db
wMapWidth:: ; d665
    db
wMapBlocksPointer:: ; d666
	dw
    ds 2 ; TODO
wMapScriptPtr:: ; d66a
    dw
wMapObjectsPtr:: ; d66c
    dw
wMapConnections:: ; d66e
    db
wMapAttributesEnd:: ; d66f

wNorthMapConnection:: map_connection_struct wNorth ; d66f
wSouthMapConnection:: map_connection_struct wSouth ; d67b
wWestMapConnection::  map_connection_struct wWest  ; d687
wEastMapConnection::  map_connection_struct wEast  ; d693


wTileset:: ; d69f
wTilesetBank:: ; d69f
	db
wTilesetBlocksAddress:: ; d6a0
	dw
wTilesetTilesAddress:: ; d6a2
	dw
wTilesetCollisionAddress:: ; d6a4
	dw
	ds 4 ; TODO
wTilesetEnd:: ; d6aa


SECTION "PokeDexFlags", WRAM0[$D81A]

wPokedexOwned::    ; d81a
    flag_array NUM_POKEMON
wPokedexOwnedEnd:: ; d839

wPokedexSeen::     ; d83a
    flag_array NUM_POKEMON
wPokedexSeenEnd::  ; d859

wAnnonDex:: ds 26  ; d85a

wAnnonID:: ds 1    ; d874


SECTION "Wild mon buffer", WRAM0[$D91B]

wWildMons:: ; d91b
	ds 41


SECTION "Stack bottom", WRAM0[$DFFF]

; Where SP is set at game init
wStackBottom:: ; dfff
; Due to the way the stack works (`push` first decrements, then writes), the byte at $DFFF is actually wasted
