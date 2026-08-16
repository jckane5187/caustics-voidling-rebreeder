# Caustic's Voidling Re-breeder

## Description
Voidling Re-breeder is a simple Lua script designed to allow Wranglers to immediately repeat breeding with the currently assigned pair, bypassing the multiple interactions required by the base game. All you have to do is collect the eggs and confirm the new breed. The final confirmation is required if you decide to change out the pair instead of repeating it. It is known to work with the current version of Voidling Bound as of 16 Aug 26. Feel free to update it if a game update breaks it and I don't provide an updated version.

## Usage
1. Collect the eggs from a completed breed.
2. Immediately opens the breeding GUI again and load it with the same breeding pair.
3. You either confirm the breed or change out the pair for a new one.

## Requirements
- UE4SS
- Custom AOB Signature FName_Constructor.lua (provided, created by Tripsette)

## Installation Instructions
***This mod requires the experimental build of UE4SS, since Voidling Bound runs on Unreal Engine 5.7.4.***
1. Install UE4SS to Voidling Bound's Steam folder. Download the latest experimental build from the [UE4SS GitHub Releases Page](https://github.com/UE4SS-RE/RE-UE4SS/releases). Under Assets, it should be the file that starts with UE4SS_vSOMETHING. You do not need the zDEV version.
   Extract the .zip into your game's Steam directory:
   `steamapps\common\Voidling Bound\VoidlingWrangler\Binaries\Win64\`
   Ensure the ue4ss folder and the dwmapi.dll file are both visible in this directory
2. Extract this mod's .zip in the same directory as above. Merge any folders when prompted. This will put the required AOB signature:
   `FName_Constructor.lua`
   into the correct folder within UE4SS:
   `UE4SS_Signatures`
   and put the mod:
   `CausticsVoidlingRebreeder`
   into the mod folder:
   `Mods`
   If any of these files are misplaced, put them into the correct folders listed above.
3. Play the game!

## Known Issues
- Visual bugs occur with the nests not showing the correct animation/state for breeding. This does not hinder function; it's just a bit ugly.
- A hard-coded delay was required to make this functional. If it does not work for you, open the main.lua file in Notepad or other basic text editors, find this line: `ExecuteWithDelay(2400, function()` and increase 2400 (ms) to a higher number. The delay should be slightly longer than the amount of time it takes for the breeding GUI to appear on screen.

## Credits
- Tripsette for providing the custom AOB Signature that made modding with UE4SS possible ([their mod here](https://www.nexusmods.com/voidlingbound/mods/5))
- UE4SS team for the tools to mod with Unreal Engine-based games
