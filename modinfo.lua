name = "Automatic Serverclean"
description = [[Custom server cleaning, providing automatic and manual modes.]]
author = "Original by Lolligoo - Translated by MissN"
version = "0.2"
api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"
dst_compatible = true
dont_starve_compatible = true
reign_of_giants_compatible = true
all_clients_require_mod = false
client_only_mod = false
server_only_mod = true
server_filter_tags = {"autoclean"}

descoption =
{
	{description = "Yes", data = true, hover = "Clean up"},
	{description = "No", data = false, hover = "Clean up"},
}
countoption =
{
	{description = "0", data = 0, hover = ""},
	{description = "5", data = 5, hover = ""},
	{description = "10", data = 10, hover = ""},
	{description = "20", data = 20, hover = ""},
	{description = "30", data = 30, hover = ""},
	{description = "40", data = 40, hover = ""},
	{description = "50", data = 50, hover = ""},
	{description = "100", data = 100, hover = ""},
}
configuration_options =
{
	{
		name = "cleanmodel",
        label = "Cleanup mode",
        options = {
					{description = "Automatic mode", data = true, hover = "Clean up server trash regularly"},
					{description = "Manual mode", data = false, hover = "Enter $clean in chat box to manually clean up server trash"},
				},
        default = true,
	},
    {
        name = "time",
        label = "Clearing interval",
        options =
        {
            {description = "every 0.5 Day", data = 0.5},
            {description = "every Day", data = 1},
            {description = "every 2 Days", data = 2},
            {description = "every 3 Days", data = 3},
            {description = "every 4 Days", data = 4},
            {description = "every 5 Days", data = 5},
            {description = "every 6 Days", data = 6},
            {description = "every 7 Days", data = 7},
            {description = "every 8 Days", data = 8},
            {description = "every 9 Days", data = 9},
            {description = "every 10 Days", data = 10},
            {description = "every 11 Days", data = 11},
            {description = "every 12 Days", data = 12},
            {description = "every 13 Days", data = 13},
            {description = "every 14 Days", data = 14},
            {description = "every 15 Days", data = 15},
        },
        default = 5,
    }
}
local function AddPrefab(name, label, df)
	configuration_options[#configuration_options + 1] = {
		name = name,
		label = label,
		options = descoption,
		default = df,
	}
end

local function AddCount(name, label, df)
	configuration_options[#configuration_options + 1] = {
		name = name,
		label = label,
		options = countoption,
		default = df,
	}
end

AddPrefab("iseventclean", "Whether to clean up event items (winter feast, etc.)", true)
AddCount("eventcleancount", "Retained quantity of event items", 0)
AddPrefab("stump", "Retained quantity of Stumps", true)
AddCount("stumpcount", "Number of Stumps retained", 0)
AddPrefab("monkey", "Whether to clean up monkeys", true)
AddCount("monkeycount", "Number of Monkets retained", 0)
AddPrefab("backpack", "Whether to clean up Backpacks", false)
AddCount("backpackcount", "Number of Backpacks retained", 0)
AddPrefab("goose_feather", "Whether to clean up Goosefeathers", false)
AddCount("goose_feathercount", "Number of Goosefeathers retained", 0)
AddPrefab("cutreeds", "Whether to clean up Cutreeds", false)
AddCount("cutreedscount", "Number of Cutreeds retained", 0)
AddPrefab("cutgrass", "Whether to clean up Cutgrass", false)
AddCount("cutgrasscount", "Number of Cutgrass retained", 0)
AddPrefab("armorgrass", "Whether to clean up Grass-Armor", true)
AddCount("armorgrasscount", "Number of Grassarmor retained", 0)
AddPrefab("shovel", "Whether to clean up Shovels", false)
AddCount("shovelcount", "Number of Shovels retained", 0)
AddPrefab("feather_canary", "Whether to clean up Canary Feathers", true)
AddCount("feather_canarycount", "Number of Canary feathers retained", 0)
AddPrefab("marble", "Whether to clean up Marble", false)
AddCount("marblecount", "Number of Marbel retained", 0)
AddPrefab("spider_hider", "Whether to clean up Spider Hider", true)
AddCount("spider_hidercount", "Number of Spider hider retained", 0)
AddPrefab("twiggy_nut", "Whether to clean up Twiggy Nuts", true)
AddCount("twiggy_nutcount", "Number of Twiggiynuts retained", 0)
AddPrefab("poop", "Whether to clean up Poop", false)
AddCount("poopcount", "Number of Poop retained", 0)
AddPrefab("stinger", "Whether to clean up Stinger", true)
AddCount("stingercount", "Number of Stinger retained", 0)
AddPrefab("axe", "Whether to clean up Axes", false)
AddCount("axecount", "Number of Axes retained", 0)
AddPrefab("rottenegg", "Whether to clean up rotten Eggs", true)
AddCount("rotteneggcount", "Number of rotten Eggs retained", 0)
AddPrefab("spoiled_food", "Whether to clean up spoiled food", false)
AddCount("spoiled_foodcount", "Number of Spoiled food retained", 0)
AddPrefab("boneshard", "Whether to clean up boneshards", false)
AddCount("boneshardcount", "Number of boneshards retained", 0)
AddPrefab("winterhat", "Whether to clean up Winterhats", false)
AddCount("winterhatcount", "Number of winterhats retained", 0)
AddPrefab("redlantern", "Whether to clean up Lanterns", true)
AddCount("redlanterncount", "Number of Laterns retained", 0)
AddPrefab("firecrackers", "Whether to clean up Firecrackers", true)
AddCount("firecrackerscount", "Number of Firecrackers retained", 0)
AddPrefab("feather_robin", "Whether to clean up robin feathers", true)
AddCount("feather_robincount", "Number of Robinfeather retained", 0)
AddPrefab("beardhair", "Whether to clean up beardhair", true)
AddCount("beardhaircount", "Number bearhair retained", 0)
AddPrefab("catcoonhat", "Whether to clean up Catcoonhats", true)
AddCount("catcoonhatcount", "Number of Catcookhats retained", 0)
AddPrefab("goldenshovel", "Whether to clean up golden Shovels", false)
AddCount("goldenshovelcount", "Number of goldenshovels retained", 0)
AddPrefab("goldenaxe", "Whether to clean up golgen Axes", false)
AddCount("goldenaxecount", "Number of golgen Axes retained", 0)
AddPrefab("torch", "Whether to clean up Torches", false)
AddCount("torchcount", "Number of Torches retained", 0)
AddPrefab("slurtleslime", "Whether to clean up Slurtle Slime", true)
AddCount("slurtleslimecount", "Number of slurtleslime retained", 0)
AddPrefab("pig_token", "Whether to clean up Pigtoken", true)
AddCount("pig_tokencount", "Number of  Pigtoken retained", 0)
AddPrefab("researchlab", "Whether to clean up Science Machines", true)
AddCount("researchlabcount", "Number of Science Machines retained", 0)
AddPrefab("skeleton_player", "Whether to clean up Skeletonplayer", true)
AddCount("skeleton_playercount", "Number of Skeletonplayer retained", 0)
AddPrefab("hound", "Whether to clean up Hounds", true)
AddCount("houndcount", "Number of Hounds retained", 0)
AddPrefab("bee", "Whether to clean up Bees", true)
AddCount("beecount", "Number of Bees retained", 0)
AddPrefab("charcoal", "Whether to clean up Charcoal", false)
AddCount("charcoalcount", "Number of Charcoal retained", 0)
AddPrefab("guano", "Whether to clean up Guano", false)
AddCount("guanocount", "Number of Guano retained", 0)
AddPrefab("beefalowool", "Whether to clean up Beefalowool", false)
AddCount("beefalowoolcount", "Number of Beefalowool retained", 0)
AddPrefab("phlegm", "Whether to clean up  Phlegm", true)
AddCount("phlegmcount", "Number of Phlegm retained", 0)
AddPrefab("spider_spitter", "Whether to clean up Spider spitters ", true)
AddCount("spider_spittercount", "Number of Spiderspitters retained", 0)
AddPrefab("houndstooth", "Whether to clean up Hundstooth", false)
AddCount("houndstoothcount", "Number of houndstooth retained", 0)
AddPrefab("killerbee", "Whether to clean up Killerbees", true)
AddCount("killerbeecount", "Number of Killerbees retained", 0)
AddPrefab("twigs", "Whether to clean up  Twigs", false)
AddCount("twigscount", "Number of Twigs retained", 0)
AddPrefab("pinecone", "Whether to clean up Pinecones", false)
AddCount("pineconecount", "Number of Pincones retained", 0)
AddPrefab("flint", "Whether to clean up  flint", true)
AddCount("flintcount", "Numbe rof flint retained", 0)
AddPrefab("candybag", "Whether to clean up  Candybag", true)
AddCount("candybagcount", "Number of Candybags retained", 0)
AddPrefab("lantern", "Whether to clean up latern", false)
AddCount("lanterncount", "Number of Laterns retained", 0)
AddPrefab("earmuffshat", "Whether to clean up  Earmuffs", true)
AddCount("earmuffshatcount", "Number of Earmuffs retained", 0)
AddPrefab("bunnyman", "Whether to clean up Bunnyman", false)
AddCount("bunnymancount", "Number of Bunnyman retained", 0)
AddPrefab("manrabbit_tail", "Whether to clean up Manrabbit Tails", true)
AddCount("manrabbit_tailcount", "Number of Manrabbit Tails retained", 0)
AddPrefab("rabbit", "Whether to clean up Rabbits", false)
AddCount("rabbitcount", "Number of Rabbits retained", 0)
AddPrefab("balloons_empty", "Whether to clean up  empty balloons", true)
AddCount("balloons_emptycount", "Number of empty Balloons retained", 0)
AddPrefab("mosquito", "Whether to clean up Mosquitos", true)
AddCount("mosquitocount", "Number of Mosquitos retained", 0)
AddPrefab("mosquitosack", "Whether to clean up Mosquitosacks", true)
AddCount("mosquitosackcount", "Number of Mosquitosacks retained", 0)
AddPrefab("slurtle_shellpieces", "Whether to clean up Slurle Shellpieces", true)
AddCount("slurtle_shellpiecescount", "Number of Slurtle Shelloieces retained", 0)
AddPrefab("feather_crow", "Whether to clean up Crowfeathers", false)
AddCount("feather_crowcount", "Number of Crowfeathers retained", 0)
AddPrefab("deer", "Whether to clean up Deers", false)
AddCount("deercount", "Number of Deers retained", 0)
AddPrefab("antlion_sinkhole", "Whether to clean up Antlions sinkholes", true)
AddCount("antlion_sinkholecount", "Number of Antlions sinkholes retained", 0)
AddPrefab("nitre", "Whether to clean up Nitre", false)
AddCount("nitrecount", "Number of Nitr retained", 0)
AddPrefab("houndwhistle", "Whether to clean up Houndswhistle", true)
AddCount("houndwhistlecount", "Number of Houndswhistle retained", 0)
AddPrefab("dragonheadhat", "Whether to clean up Dragonhat", true)
AddCount("dragonheadhatcount", "Number of Dragonhats retained", 0)
AddPrefab("dragonbodyhat", "Whether to clean up Dragonbody Hat", true)
AddCount("dragonbodyhatcount", "Number of Dragin Body Hats retained", 0)
AddPrefab("dragontailhat", "Whether to clean up Dragon Tail Hat", true)
AddCount("dragontailhatcount", "Number of Dragon Tail Hats retained", 0)
AddPrefab("spider_dropper", "Whether to clean up Dangling Depth Dweller", true)
AddCount("spider_droppercount", "Number of Dangling Depth Dweller retained", 0)
AddPrefab("feather_robin_winter", "Whether to clean up Winter Robin Feathers", true)
AddCount("feather_robin_wintercount", "Number of winter Robin Feathers retained", 0)
AddPrefab("lavae_egg", "Whether to clean up Lavae Eggs", true)
AddCount("lavae_eggcount", "Number of Lavae Eggs retained", 0)
AddPrefab("winter_food4", "Whether to clean up Winterfood", false)
AddCount("winter_food4count", "Number of Winterfood retained", 0)
AddPrefab("merm", "Whether to clean up merm", true)
AddCount("mermcount", "Number of merms retained", 0)
AddPrefab("spider", "Whether to clean up Spiders", true)
AddCount("spidercount", "Number of Spiders retained", 0)
AddPrefab("spiderhat", "Whether to clean up Spiderhats", true)
AddCount("spiderhatcount", "Number of Spiderhats retained", 0)
AddPrefab("spiderqueen", "Whether to clean up Spiderqueens", true)
AddCount("spiderqueencount", "Number of Spiderqueens retained", 0)
AddPrefab("silk", "Whether to clean up Silk", false)
AddCount("silkcount", "Number of Silk retained", 0)
AddPrefab("spidergland", "Whether to clean up Spidergland", true)
AddCount("spiderglandcount", "Number of Spidergland retained", 0)
AddPrefab("spider_warrior", "Whether to clean up Spiderwarriors", true)
AddCount("spider_warriorcount", "Number of Spiderwarriors retained", 0)
AddPrefab("compass", "Whether to clean up Compass'", true)
AddCount("compasscount", "Number of Compass' retained", 0)
AddPrefab("seeds", "Whether to clean up Seeds", false)
AddCount("seedscount", "Number of Seeds retained", 0)