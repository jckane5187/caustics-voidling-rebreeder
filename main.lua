--[[RegisterHook(
    "/Game/Blueprints/Hub/BP_BreedingStation.BP_BreedingStation_C:ClearCreaturePreview",
    function(self)
        print("[BreedingResearch] ClearCreaturePreview fired")
        print(string.format("UObject Name: %s", self:Get():GetFullName()))
    end
)
    ]]

RegisterHook(
    "/Game/Blueprints/Hub/BP_BreedingStation.BP_BreedingStation_C:OnEggInteractable",
    function(self)
        local station = self:Get()
        local creatures = station.CreaturesDataPreview
        local parent_A = creatures[1]
        local parent_B = creatures[2]
        local before_instances = FindAllOf("WBP_Breeding_Main_C")
        local new_instance = nil
        print("[BreedingResearch] OnEggInteractable fired")
        print(string.format("UObject Name: %s", station:GetFullName()))
        print(string.format("CreaturesDataPreview: %s", creatures))
        print(string.format("Parent A: %s", parent_A:GetFullName()))
        print(string.format("Parent B: %s", parent_B:GetFullName()))
        if before_instances then
            for Index, before_instance in pairs(before_instances) do
                print(string.format("BEFORE: [%d] %s", Index, before_instance:GetFullName()))
            end
        else
            print("BEFORE: GUI NOT FOUND")
        end
        station:OnTrigger_Event(station)
        ExecuteWithDelay(2400, function()
            local after_instances = FindAllOf("WBP_Breeding_Main_C")
            if after_instances then
                for Index, after_instance in pairs(after_instances) do
                    print(string.format("AFTER: [%d] %s", Index, after_instance:GetFullName()))
                end
                for _, after_instance in pairs(after_instances) do
                    local existed_before = false

                    if before_instances then
                        for _, before_instance in pairs(before_instances) do
                            if after_instance:GetFullName() == before_instance:GetFullName() then
                                existed_before = true
                                break
                            end
                        end
                    end

                    if not existed_before then
                        new_instance = after_instance
                        break
                    end
                end
            else
                print("AFTER: GUI NOT FOUND")
            end
            if new_instance then
                print(string.format("New Instance: %s", new_instance:GetFullName()))
            else
                print("New Instance Not Found")
            end
            new_instance.FirstCreature = parent_A
            new_instance.SecondCreature = parent_B
            new_instance:Refresh()
        end
        )  
    end
)