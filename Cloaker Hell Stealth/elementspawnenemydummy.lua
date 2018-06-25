
if (SC and SC._data and SC._data.sc_ai_toggle) or (DW and DW.settings and DW.settings.dw_enemy_toggle_value) then return end

local ai_type = tweak_data.levels:get_ai_group_type()
local job = Global.level_data and Global.level_data.level_id
if ai_type ~= "america" or job == "brb" or job == "election_day_3" or job == "moon" or job == "arm_cro" or job == "arm_und" or job == "arm_par" or job == "arm_fac" or job == "arm_hcm" then return end

local sm_wish = {
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_security_5/ene_security_5"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_security_6/ene_security_6"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_security_7/ene_security_7"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_security_8/ene_security_8"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] =  "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] =  "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/pd2_dlc_arena/characters/ene_guard_security_heavy_1/ene_guard_security_heavy_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker",
		["units/pd2_dlc_arena/characters/ene_guard_security_heavy_2/ene_guard_security_heavy_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"
	}

local deathwish = {
		["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] =  "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] =  "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_security_1/ene_security_1"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_security_2/ene_security_2"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_security_3/ene_security_3"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_security_4/ene_security_4"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_security_5/ene_security_5"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_security_6/ene_security_6"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_security_7/ene_security_7"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_security_8/ene_security_8"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/payday2/characters/ene_swat_spook_1/ene_spook_1",
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/payday2/characters/ene_swat_spook_1/ene_spook_1",
		["units/pd2_dlc_arena/characters/ene_guard_security_heavy_1/ene_guard_security_heavy_1"] = "units/payday2/characters/ene_spook_1/ene_spook_1",
		["units/pd2_dlc_arena/characters/ene_guard_security_heavy_2/ene_guard_security_heavy_2"] = "units/payday2/characters/ene_spook_1/ene_spook_1"
	}

function ElementSpawnEnemyDummy:init(...)
	ElementSpawnEnemyDummy.super.init(self, ...)
	local ai_type = tweak_data.levels:get_ai_group_type()
    local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
    local difficulty_index = tweak_data:difficulty_to_index(difficulty)
    local job = Global.level_data and Global.level_data.level_id

    if ai_type == "america" and job ~= "brb" or job ~= "election_day_3" or job ~= "moon" or job ~= "arm_cro" or job ~= "arm_und" or job ~= "arm_par" or job ~= "arm_fac" or job ~= "arm_hcm"then
        if difficulty_index == 8 then
            if sm_wish[self._values.enemy] then
                self._values.enemy = sm_wish[self._values.enemy]
            end
            self._values.enemy = sm_wish[self._values.enemy] or self._values.enemy
        elseif difficulty_index == 7 or difficulty_index == 6 or difficulty_index == 5 or difficulty_index == 3 or difficulty_index <=2 then
            if deathwish[self._values.enemy] then
                self._values.enemy = deathwish[self._values.enemy]
            end
            self._values.enemy = deathwish[self._values.enemy] or self._values.enemy
        end
    
	self._enemy_name = self._values.enemy and Idstring(self._values.enemy) or Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
	self._values.enemy = nil
	self._units = {}
	self._events = {}
	self:_finalize_values()
end

end