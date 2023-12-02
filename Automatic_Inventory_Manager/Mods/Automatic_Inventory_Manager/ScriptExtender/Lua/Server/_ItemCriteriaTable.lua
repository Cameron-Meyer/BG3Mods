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

-- Since moving/creating items in a way that ensures a new item UUID is created is an event, not just a DB update, you can't just move an item and immediately tag it as processed <br/>
-- You need to move it, then wait for the *AddedTo event to fire. So, this global map serves as a tracker for what templates
-- were added to which characters, so that when that event fires, _hopefully_ we can match it and not process it again
TEMPLATES_BEING_TRANSFERRED = {}
