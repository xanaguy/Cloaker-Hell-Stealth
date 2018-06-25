Hooks:PostHook(CharacterTweakData, "init", "pager_init", function(self, tweak_data)
	self:_create_table_structure()
end)

Hooks:PostHook(CharacterTweakData, "_init_spooc", "pager_cloaker", function(self, presets)

		self.spooc.has_alarm_pager = true
		self.spooc.access = "security"

	table.insert(self._enemy_list, "spooc")
end)
