local function RegisterBreedingHook()
    local hook_target =
        "/Game/Blueprints/Hub/BP_BreedingStation.BP_BreedingStation_C:OnEggInteractable" -- This is the egg collection trigger

    local function_object = StaticFindObject(hook_target)

    if not function_object or not function_object:IsValid() then
        return false
    end

    RegisterHook(
        hook_target,
        function(self)
            local station = self:Get() -- Current breeding nest object
            local creatures = station.CreaturesDataPreview -- Current table of breeding pair data
            local parent_A = creatures[1]
            local parent_B = creatures[2]
            if not parent_A or not parent_B then
                print("[Caustic's Voidling Re-breeder] Error: Breeding parent data not found")
                return
            end
            local before_instances = FindAllOf("WBP_Breeding_Main_C") -- Required for finding the correct nest GUI. Voidling Bound keeps old instances in memory
            local new_instance = nil -- Will be used for the new nest GUI when found
            station:OnTrigger_Event(station)
            ExecuteWithDelay(2400, function() -- The breeding GUI is created asynchronously, which requires a pause before searching for the new instance (approximately the moment it appears on-screen)
                -- Increase the delay if the new GUI is not found reliably
                local after_instances = FindAllOf("WBP_Breeding_Main_C") -- Similar to before_instances, required to determine which GUI is the correct one
                if after_instances then
                    for _, after_instance in pairs(after_instances) do -- Compares the two tables and looks for the new instance
                        local existed_before = false -- Simple flag to trigger new_instance population later
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
                end
                if not new_instance then
                    print("[Caustic's Voidling Re-breeder] Error: New breeding UI instance not found")
                    return
                end
                new_instance.FirstCreature = parent_A
                new_instance.SecondCreature = parent_B
                new_instance:Refresh()
            end)  
        end
    )
    return true
end

LoopAsync(1000, function() -- Loop until function registers
    return RegisterBreedingHook()
end)