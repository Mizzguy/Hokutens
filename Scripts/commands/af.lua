-------------------------------------------------------
-- func: @af <job>
-- desk: opens af shop for specified job
-- author: chops
-------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player,page)
    
	local level = player:getMainLvl();
	
	if (level >= 60) then
	
		if (page == nil) then
			player:PrintToPlayer( "You must enter your job");
			player:PrintToPlayer( "war, mnk, whm, blm, rdm, thf, pld, drk, bst, brd");
			player:PrintToPlayer( "rng, sam, nin, drg, smn, blu, pup, cor, dnc, sch");
		elseif (page == "war") then
			local stock_1 =
				{
				12511,1, -- Fighter's Mask
				12638,1, -- Fighter's Lorica
				13961,1, -- Fighter's Mufflers
				14214,1, -- Fighter's Cuisses
				14089,1, -- Fighter's Calligae
				};
			showShop(player, STATIC, stock_1);
			player:PrintToPlayer( "Warriors: Welcome, Kupo!");
		elseif (page == "mnk") then
			local stock_2 =
				{
				12512,1, -- Temple Crown
				12639,1, -- Temple Cyclas
				13962,1, -- Temple Gloves
				14215,1, -- Temple Hose
				14090,1, -- Temple Gaiters
				};
			showShop(player, STATIC, stock_2);
			player:PrintToPlayer( "Monks: Welcome, Kupo!");
		elseif (page == "whm") then
			local stock_3 =
				{
				13855,1, -- Healer's Cap
				12640,1, -- Healer's Briault
				13963,1, -- Healer's Mitts
				14216,1, -- Healer's Pantaloons
				14091,1, -- Healer's Duckbills
				};
			showShop(player, STATIC, stock_3);
			player:PrintToPlayer( "White Mages: Welcome, Kupo!");
		elseif (page == "blm") then
			local stock_4 =
				{
				13856,1, -- Wizard's Petasos
				12641,1, -- Wizard's Coat
				13964,1, -- Wizard's Gloves
				14217,1, -- Wizard's Tonban
				14092,1, -- Wizard's Sabots
				};
			showShop(player, STATIC, stock_4);
			player:PrintToPlayer( "Black Mages: Welcome, Kupo!");
		elseif (page == "rdm") then
			local stock_5 =
				{
				12513,1, -- Warlock's Chapeau
				12642,1, -- Warlock's Tabard
				13965,1, -- Warlock's Gloves
				14218,1, -- Warlock's Tights
				14093,1, -- Warlock's Boots
				};
			showShop(player, STATIC, stock_5);
			player:PrintToPlayer( "Red Mages: Welcome, Kupo!");
		elseif (page == "thf") then
			local stock_6 =
				{
				12514,1, -- Rogue's Bonnet
				12643,1, -- Rogue's Vest
				13966,1, -- Rogue's Armlets
				14219,1, -- Rogue's Culottes
				14094,1, -- Rogue's Poulaines
				};
			showShop(player, STATIC, stock_6);
			player:PrintToPlayer( "Theives: Welcome, Kupo!");
		elseif (page == "pld") then
			local stock_7 =
				{
				12515,1, -- Gallant Coronet
				12644,1, -- Gallant Surcoat
				13967,1, -- Gallant Gauntlets
				14220,1, -- Gallant Breeches
				14095,1, -- Gallant Leggings
				};
			showShop(player, STATIC, stock_7);
			player:PrintToPlayer( "Paladins: Welcome, Kupo!");
		elseif (page == "drk") then
			local stock_8 =
				{
				12516,1, -- Chaos Burgeonet
				12645,1, -- Chaos Cuirass
				13968,1, -- Chaos Gauntlets
				14221,1, -- Chaos Flanchard
				14096,1, -- Chaos Sollerets
				};
			showShop(player, STATIC, stock_8);
			player:PrintToPlayer( "Dark Knights: Welcome, Kupo!");
		elseif (page == "bst") then
			local stock_9 =
				{
				12517,1, -- Beast Helm
				12646,1, -- Beast Jackcoat
				13969,1, -- Beast Gloves
				14222,1, -- Beast Trousers
				14097,1, -- Beast Gaiters
				};
			showShop(player, STATIC, stock_9);
			player:PrintToPlayer( "Beastmasters: Welcome, Kupo!");
		elseif (page == "brd") then
			local stock_10 =
				{
				13857,1, -- Choral Roundlet
				12647,1, -- Choral Justaucorps
				13970,1, -- Choral Cuffs
				14223,1, -- Choral Cannions
				14098,1, -- Choral Slippers
				};
			showShop(player, STATIC, stock_10);
			player:PrintToPlayer( "Bards: Welcome, Kupo!");
		elseif (page == "rng") then
			local stock_11 =
				{
				12518,1, -- Hunter's Beret	
				12648,1, -- Hunter's Jerkin
				13971,1, -- Hunter's Bracers
				14224,1, -- Hunter's Braccae
				14099,1, -- Hunter's Socks
				};
			showShop(player, STATIC, stock_11);
			player:PrintToPlayer( "Rangers: Welcome, Kupo!");
		elseif (page == "sam") then
			local stock_12 =
				{
				13868,1, -- Myochin Kabuto	
				13781,1, -- Myochin Domaru
				13972,1, -- Myochin Kote
				14225,1, -- Myochin Haidate
				14100,1, -- Myochin Sune-Ate
				};
			showShop(player, STATIC, stock_12);
			player:PrintToPlayer( "Samurais: Welcome, Kupo!");
		elseif (page == "nin") then
			local stock_13 =
				{
				13869,1, -- Ninja Hatsuburi
				13782,1, -- Ninja Chainmail
				13973,1, -- Ninja Tekko
				14226,1, -- Ninja Hakama
				14101,1, -- Ninja Kyahan
				};
			showShop(player, STATIC, stock_13);
			player:PrintToPlayer( "Ninjas: Welcome, Kupo!");
		elseif (page == "drg") then
			local stock_14 =
				{
				12519,1, -- Drachen Armet
				12649,1, -- Drachen Mail
				13974,1, -- Drachen Finger Gauntlets
				14227,1, -- Drachen Brais
				14102,1, -- Drachen Greaves
				};
			showShop(player, STATIC, stock_14);
			player:PrintToPlayer( "Dragoons: Welcome, Kupo!");
		elseif (page == "smn") then
			local stock_15 =
				{
				12520,1, -- Evoker's Horn
				12650,1, -- Evoker's Doublet
				13975,1, -- Evoker's Bracers
				14228,1, -- Evoker's Spats
				14103,1, -- Evoker's Pigaches
				};
			showShop(player, STATIC, stock_15);
			player:PrintToPlayer( "Summoners: Welcome, Kupo!");
		elseif (page == "blu") then
			local stock_16 =
				{
				15265,1, -- Magus Keffiyeh
				14521,1, -- Magus Jubbah
				14928,1, -- Magus Bazubands
				15600,1, -- Magus Shalwar
				15684,1, -- Magus Charuqs
				};
			showShop(player, STATIC, stock_16);
			player:PrintToPlayer( "Blue Mages: Welcome, Kupo!");
		elseif (page == "cor") then
			local stock_17 =
				{
				18702,1, -- Trump Gun
				15810,1, -- Luzaf's Ring
				15266,1, -- Corsair's Tricorne
				14522,1, -- Corsair's Frac
				14929,1, -- Corsair's Gants
				15601,1, -- Corsair's Culottes
				15685,1, -- Corsair's Bottes
				};
			showShop(player, STATIC, stock_17);
			player:PrintToPlayer( "Corsairs: Welcome, Kupo!");
		elseif (page == "pup") then
			local stock_18 =
				{
				15267,1, -- Puppetry Taj
				14523,1, -- Puppetry Tobe
				14930,1, -- Puppetry Dastanas
				15602,1, -- Puppetry Churidars
				15686,1, -- Puppetry Babouches
				};
			showShop(player, STATIC, stock_18);
			player:PrintToPlayer( "Puppetmasters: Welcome, Kupo!");
		elseif (page == "dnc") then
			local stock_19 =
				{
				16138,1, -- Dancer's Tiara (M)
				16139,1, -- Dancer's Tiara (F)
				14578,1, -- Dancer's Casaque (M)
				14579,1, -- Dancer's Casaque (F)
				15002,1, -- Dancer's Bangles (M)
				15003,1, -- Dancer's Bangles (F)
				15659,1, -- Dancer's Tights (M)
				15660,1, -- Dancer's Tights (F)
				15746,1, -- Dancer's Toe Shoes (M)
				15747,1, -- Dancer's Toe Shoes (F)
				};
			showShop(player, STATIC, stock_19);
			player:PrintToPlayer( "Dancers: Welcome, Kupo!");
		elseif (page == "sch") then
			local stock_19 =
				{
				16140,1, -- Scholar's Mortarboard
				14580,1, -- Scholar's Gown
				15004,1, -- Scholar's Bracers
				16311,1, -- Scholar's Pants
				15748,1, -- Scholar's Loafers
				};
			showShop(player, STATIC, stock_19);
			player:PrintToPlayer( "Scholars: Welcome, Kupo!");
		else
			player:PrintToPlayer( string.format( "That won't work!", page ) );
		end
	else
		player:PrintToPlayer( "You need to be at least level 60 to access this shop, kupo!");
	end
end;