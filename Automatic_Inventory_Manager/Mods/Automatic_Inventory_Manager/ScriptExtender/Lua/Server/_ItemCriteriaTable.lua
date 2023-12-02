MODE = 'MODE'
------------
MODE_DIRECT = 'DIRECT'
TARGET = 'TARGET'
------------
ALL_ITEMS_MATCHING_MAP_CATEGORY = "*"
------------
MODE_WEIGHT_BY = 'WEIGHT_BY'
CRITERIA = 'CRITERIA'
STACK_LIMIT = 'STACK_LIMIT'
------------
COMPARATOR = "COMPARATOR"
LESS_THAN = "LESS_THAN"
GREATER_THAN = "GREATER_THAN"
------------
STAT = "STAT"
STAT_HEALTH_PERCENTAGE = "HEALTH %"
STAT_STACK_AMOUNT = "STACK AMOUNT"
STAT_PROFICIENCY = "PROFICIENCY"
-----
STAT_SKILL = "SKILL"
STAT_SKILL_SLIGHT_OF_HAND = "SleightOfHand"
------------
EQUIPMENT_MAP = {
	[ALL_ITEMS_MATCHING_MAP_CATEGORY] = {
		[MODE] = MODE_WEIGHT_BY,
		[CRITERIA] = {
			[1] = { [STAT] = STAT_PROFICIENCY }
		}
	}
}

TAGS_MAP = {
	["HEALING_POTION"] = {
		[MODE] = MODE_WEIGHT_BY,
		[CRITERIA] = {
			[1] = { [STAT] = STAT_HEALTH_PERCENTAGE, [COMPARATOR] = LESS_THAN, },
			[2] = { [STAT] = STAT_STACK_AMOUNT, [COMPARATOR] = LESS_THAN }
		},
		[STACK_LIMIT] = 2
	},
	["LOCKPICKS"] = {
		[MODE] = MODE_WEIGHT_BY,
		[CRITERIA] = {
			[1] = { [STAT] = STAT_SKILL, [STAT_SKILL] = STAT_SKILL_SLIGHT_OF_HAND, [COMPARATOR] = GREATER_THAN, },
			[2] = { [STAT] = STAT_STACK_AMOUNT, [COMPARATOR] = GREATER_THAN }
		}
	}
}
