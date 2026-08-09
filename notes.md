Live UI for breeding:
  WBP_Breeding_Main_C transient instance
  FirstCreature
  SecondCreature - holds specific inventory data for the creature ("InventoryCreatureData /Engine/Transient.GameEngine_2147482590:DefaultGameInstance_C_2147482521.PlayerProgression_2147330332.CreatureInventory_2147330331.InventoryCreatureData_2147330326")
  Station - likely the actual nest interacted with ("BP_BreedingStation_C /Game/Levels/Prototype/Crafting/ProtoCrafting_Hub.ProtoCrafting_Hub:PersistentLevel.BP_BreedingNest_C_UAID_F02F74F2B5137D9F02_1945242431")

Important Functions:
  BndEvt__WBP_Breeding_Main_FirstCreatureButton - Opens the inventory to select the first creature
  BndEvt__WBP_Breeding_Main_SecondCreatureButton - Opens the inventory to select the second creature
  BndEvt__WBP_Breeding_Main_Confirm - Starts breeding

Test Details:
  Test station (Left most) - BP_BreedingStation_C /Game/Levels/Prototype/Crafting/ProtoCrafting_Hub.ProtoCrafting_Hub:PersistentLevel.BP_BreedingNest_C_UAID_F02F74F2B5137D9F02_1945242431
  Breeding Stations unload when not in the ship (could cause errors later)
  Breeding Stations have a "Player in Range" bool
  Mission test for creature IDs staying active between missions:
    2147445195 (First)
    2147445194 (Second)

Possible functions to hook:
  ClearCreaturePreview
  GetBreedingCreature | CPF_OutParm
  Destroy Creature
  Is Station Breeding Active
