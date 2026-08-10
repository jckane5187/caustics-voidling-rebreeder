Live UI for breeding:
  WBP_Breeding_Main_C transient instance
  FirstCreature
  SecondCreature - holds specific inventory data for the creature ("InventoryCreatureData /Engine/Transient.GameEngine_2147482590:DefaultGameInstance_C_2147482521.PlayerProgression_2147330332.CreatureInventory_2147330331.InventoryCreatureData_2147330326")
  Station - likely the actual nest interacted with ("BP_BreedingStation_C /Game/Levels/Prototype/Crafting/ProtoCrafting_Hub.ProtoCrafting_Hub:PersistentLevel.BP_BreedingNest_C_UAID_F02F74F2B5137D9F02_1945242431")

Important Functions:
  BndEvt__WBP_Breeding_Main_FirstCreatureButton - Opens the inventory to select the first creature
    Function /Game/UserInterface/Widgets/Menu/Breeding/WBP_Breeding_Main.WBP_Breeding_Main_C:BndEvt__WBP_Breeding_Main_FirstCreatureButton_K2Node_ComponentBoundEvent_0_OnSelected__DelegateSignature
  BndEvt__WBP_Breeding_Main_SecondCreatureButton - Opens the inventory to select the second creature
  BndEvt__WBP_Breeding_Main_Confirm - Starts breeding

Test Details:
  Test station (Left most) - BP_BreedingStation_C /Game/Levels/Prototype/Crafting/ProtoCrafting_Hub.ProtoCrafting_Hub:PersistentLevel.BP_BreedingNest_C_UAID_F02F74F2B5137D9F02_1945242431
  Breeding Stations unload when not in the ship (could cause errors later)
  Breeding Stations have a "Player in Range" bool
  Mission test for creature IDs staying active between missions (Confirmed):
    2147480505 (First)
    2147480504 (Second)
  TArray Wrapper is 1-indexed, not 0-indexed
  Station 1 - BP_BreedingStation_C /Game/Levels/Prototype/Crafting/ProtoCrafting_Hub.ProtoCrafting_Hub:PersistentLevel.BP_BreedingNest_C_UAID_F02F74F2B5137D9F02_1945242431
  Station 2 - BP_BreedingStation_C /Game/Levels/Prototype/Crafting/ProtoCrafting_Hub.ProtoCrafting_Hub:PersistentLevel.BP_BreedingNest_C_UAID_9C6B001388DD99B502_1637555561
  Station 3 - BP_BreedingStation_C /Game/Levels/Prototype/Crafting/ProtoCrafting_Hub.ProtoCrafting_Hub:PersistentLevel.BP_BreedingNest_C_UAID_047C16418A05619202_1336383744

Possible functions to hook:
  ClearCreaturePreview
  GetBreedingCreature | CPF_OutParm
  Destroy Creature
  Is Station Breeding Active
  Function /Game/Blueprints/Hub/BP_BreedingStation.BP_BreedingStation_C:OnEggInteractable
  OnTrigger_Event Function /Game/Blueprints/Hub/BP_CreatureStation_Base.BP_CreatureStation_Base_C:OnTrigger_Event

Breeding UI delay timing:
  100 - failed
  200 - failed
  300 - failed
  400 - failed
  500 - failed
  600 - failed
  700 - failed
  1200 - failed
  1500 - failed
  1700 - failed
  2000 - working, but right on the edge
  2200 - 3/3
  2300 - 
  2400 - Safer
