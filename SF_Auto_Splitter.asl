state("ShadowFlare")
{
    /*this string doesn't work anymore ugh
    string30 dialog : 0x008CE14, 0x30, 0x3C, 0x4, 0x0;
    */
    string50 dialog : 0x0080540, 0x0;
    int lvl : 0x005CA58, 0x14;
    string50 location : 0x00338FC, 0x0;
    int loading : 0x0008CE10, 0x1C, 0x54, 0x0, 0x43C;
}

startup
{
    //state
    settings.Add("gametime", true, "Enable Loading Removal");

    //episode 1
    settings.Add("ep1", true, "Episode 1 (Main Quests)");
    settings.Add("ep1_entrances", true, "Episode 1 (entrances)");
    settings.Add("ep1_side", false, "Episode 1 (Side Quests)");
    settings.Add("ep2", false, "Episode 2 (Main Quests)");

    //episode 1
    settings.CurrentDefaultParent = "ep1";
    settings.Add("reblin", true, "Red Goblin");
    settings.Add("lvl5", true, "level 5");
    settings.Add("dusty", true, "Dusty Ruins");
    settings.Add("ruby", true, "Rosanna's Ruby");
    settings.Add("cold", true, "Cold Ruins");
    settings.Add("purgatory", true, "Purgatory of Judgments");
    settings.Add("reincarnation", true, "Remains of Reincarnation");
    settings.Add("conland", true, "Continuing Land");
    settings.Add("garmains", true, "Immortal Remains");

    //episode 1 entrances
    settings.CurrentDefaultParent = "ep1_entrances";
    settings.Add("dusty_entry", true, "Dusty Ruins - entrance");
    settings.Add("cold_entry", false, "Cold Ruins - entrance");
    settings.Add("purgatory_entry", false, "Purgatory of Judgments - entrance");
    settings.Add("reincarnation_entry", false, "Remains of Reincarnation - entrance");
    settings.Add("immortal_entry", false, "Immortal Remains - entrance");

    //episode 1 side
    settings.CurrentDefaultParent = "ep1_side";
    settings.Add("malse", true, "Malse's Gem");
    settings.Add("syria", true, "Syria's Spirit Stone");
    settings.Add("gedo", true, "Errand for Edo");

    //episode 2
    settings.CurrentDefaultParent = "ep2";
    settings.Add("lvl18", true, "level 18");
    settings.Add("lvl20", true, "level 20");
    settings.Add("thieves", true, "Thieves");
    settings.Add("gandalf", true, "You shall not pass!");
    settings.Add("wizard", true, "Meet with the Wizard Kirushutat");
    settings.Add("crystal", true, "Take back the Seal Crystal");
    settings.Add("control", true, "Retake the security and control facility");
    settings.Add("power", true, "Recapture the power supply facility");
    settings.Add("dragons", true, "Defeat the Dragons!");
    
    //tooltips
    settings.SetToolTip("gametime", "Allows switching to IGT.");
    settings.SetToolTip("ep1", "Selects episode 1 main quests.");
    settings.SetToolTip("ep1_entrances", "Selects episode 1 entrances.");
    settings.SetToolTip("ep1_side", "Selects episode 1 side quests.");
    settings.SetToolTip("ep2", "Selects episode 2 main quests.");
    
    settings.SetToolTip("dusty_entry", "Splits upon entering the Dusty Ruins.");
    settings.SetToolTip("cold_entry", "Splits upon entering the Cold Ruins.");
    settings.SetToolTip("purgatory_entry", "Splits upon entering the Purgatory of Judgments.");
    settings.SetToolTip("reincarnation_entry", "Splits upon entering the Remains of Reincarnation.");
    settings.SetToolTip("immortal_entry", "Splits upon entering the Immortal Remains.");

    settings.SetToolTip("reblin", "Splits upon completing the Red Goblin quest.");
    settings.SetToolTip("lvl5", "Splits at lvl 5.");
    settings.SetToolTip("malse", "Splits upon completing the Malse's Gem quest.");
    settings.SetToolTip("syria", "Splits upon completing the Syria's Spirit Stone quest.");
    settings.SetToolTip("dusty", "Splits upon completing the Dusty Ruins quest.");
    settings.SetToolTip("ruby", "Splits upon completing the Rosanna's ruby quest.");
    settings.SetToolTip("cold", "Splits upon completing the Cold Ruins quest.");
    settings.SetToolTip("purgatory", "Splits upon completing the Purgatory quest.");
    settings.SetToolTip("reincarnation", "Splits upon completing the Reincarnation Gem quest.");
    settings.SetToolTip("conland", "Splits upon completing the Continuing conland quest.");
    settings.SetToolTip("garmains", "Splits upon entering the episode 1 epilogue screen.");
    settings.SetToolTip("gedo", "Splits upon completing the Errand for Gedo quest.");
    settings.SetToolTip("lvl20", "Splits at lvl 18."); 
    settings.SetToolTip("lvl20", "Splits at lvl 20.");    
    settings.SetToolTip("thieves", "Splits upon completing the 'Destroy Thieves staying SE of Kanfore' quest.");
    settings.SetToolTip("gandalf", "Splits upon being refused entrance to the elven city.");
    settings.SetToolTip("wizard", "Splits upon completing the 'Meet with the Wizard Kirushutat' quest.");
    settings.SetToolTip("crystal", "Splits upon completing the 'Take back the Seal Crystal' quest.");
    settings.SetToolTip("control", "Splits upon completing the 'Retake the security and control facility' quest.");
    settings.SetToolTip("power", "Splits upon completing the 'Recapture the power supply facility' quest.");
    settings.SetToolTip("dragons", "Splits upon completing the 'Defeat the Dragons!' quest.");
}

init
{
    refreshRate = 30;
}

onStart
{
	timer.IsGameTimePaused = false;
}

start
{
    vars.dusty_visited = false;
    vars.cold_visited = false;
    vars.purgatory_visited = false;
    vars.reincarnation_visited = false;
    vars.immortal_visited = false;

    if (current.lvl != old.lvl && current.lvl == 1)
    {
        return true;
    }
}

/*for debugging
update
{
    if (current.dialog != old.dialog)
    {
        print("old dialog: " + old.dialog);
        print("current dialog: " + current.dialog);
    }
    
    if (current.location != old.location)
    {
        print("old location: " + old.location);
        print("current location: " + current.location);
    }

    if (vars.dusty_visited == true)
    {
        print("Dusty Ruins have been visited.");
    }

    if (vars.dusty_visited == false)
    {
        print("Dusty Ruins have yet NOT been visited.");
    }

    // if(current.loading != old.loading) vars.Log("Loading: " + current.loading.ToString());
	// if(current.loading != old.loading) vars.Log("End Split: " + current.endSplit.ToString());
}*/

split
{	
    //LVL - lvl 5
    if (settings["lvl5"] && current.lvl != old.lvl && current.lvl == 5)
    {
        return true;
    }

    /*Location Splits (=entrances)
    ---------------------------------------------------------*/
    //LOCATION - entering dusty ruins
    if (current.location != old.location)
    {
        if (settings["dusty_entry"] && current.location.Contains("Dusty Ruins") && vars.dusty_visited == false)
        {
            vars.dusty_visited = true;
            return true;
        }
    }

    //LOCATION - entering cold ruins
    if (current.location != old.location)
    {
        if (settings["cold_entry"] && current.location.Contains("Cold Ruins") && vars.cold_visited == false)
        {
            vars.cold_visited = true;
            return true;
        }
    }

    //LOCATION - entering purgatory of judgments
    if (current.location != old.location)
    {
        if (settings["purgatory_entry"] && current.location.Contains("Purgatory") && vars.purgatory_visited == false)
        {
            vars.purgatory_visited = true;
            return true;
        }
    }

    //LOCATION - entering remains of reincarnation
    if (current.location != old.location)
    {
        if (settings["reincarnation_entry"] && current.location.Contains("Reincarnation") && vars.reincarnation_visited == false)
        {
            vars.reincarnation_visited = true;
            return true;
        }
    }

    //LOCATION - entering immortal remains
    if (current.location != old.location)
    {
        if (settings["immortal_entry"] && current.location.Contains("Immortal Remains") && vars.immortal_visited == false)
        {
            vars.immortal_visited = true;
            return true;
        }
    }

    /*Quest Splits
    ---------------------------------------------------------*/
    //red goblin
    if (current.dialog != old.dialog)
    {
        if (settings["reblin"] && current.dialog.Contains("I heard the news"))
        {
            return true;
        }
    }

    //malse
    if (current.dialog != old.dialog)
    {    
        if (settings["malse"] && current.dialog.Contains("Oh, here you are. That must be"))
        {
            return true;
        }
    }

    //syria
    if (current.dialog != old.dialog)
    {     
        if (settings["syria"] && current.dialog.Contains("Is that the stolen Spirit"))
        {
            return true;
        }
    }

    //dusty ruins
    if (current.dialog != old.dialog)
    {
        if (settings["dusty"] && current.dialog.Contains("This town is finally"))
        {
            return true;
        }
    }

    //Rosanna's ruby
    if (current.dialog != old.dialog)
    {
        if (settings["ruby"] && current.dialog.Contains("That must be the memorable ruby"))
        {
            return true;
        }
    }

    //cold ruins
    if (current.dialog != old.dialog)
    {
        if (settings["cold"] && current.dialog.Contains("You worked really hard."))
        {
            return true;
        }
    }

    //purgatory
    if (current.dialog != old.dialog)
    {
        if (settings["purgatory"] && current.dialog.Contains("You made it!"))
        {
            return true;
        }
    }

    //reincarnation
    if (current.dialog != old.dialog)
    {    
        if (settings["reincarnation"] && current.dialog.Contains("Thank you for your efforts."))
        {
            return true;
        }
    }

    //continuing land
    if (current.dialog != old.dialog)
    {
        if (settings["conland"] && current.dialog.Contains("Good job. Your report drew"))
        {
            return true;
        }
    }

    //epilogue (paired with the immortal garmains option)
    if (current.dialog != old.dialog)
    {    
        if (settings["garmains"] && current.dialog.Contains("It seems that peace has been"))
        {
            return true;
        }
    }

    //errand for Gedo
    if (current.dialog != old.dialog)
    {    
        if (settings["gedo"] && current.dialog.Contains("Oh, you brought it back like"))
        {
            return true;
        }
    }

    //---------------------------- EPISODE 2 ----------------------------
    
    //SPECIAL (lvl) - lvl 18
    if (settings["lvl18"] && current.lvl != old.lvl && current.lvl == 18)
    {
        return true;
    }

    //SPECIAL (lvl) - lvl 20
    if (settings["lvl20"] && current.lvl != old.lvl && current.lvl == 20)
    {
        return true;
    }

    //Destroy Thieves staying SE of Kanfore
    if (current.dialog != old.dialog)
    {
        if (settings["thieves"] && current.dialog.Contains("First, here is a reward for"))
        {
            return true;
        }
    }

    //Head for the mining Tunnel of Yugunos
    if (current.dialog != old.dialog)
    {
        if (settings["gandalf"] && current.dialog.Contains("Couldn't you pass through the"))
        {
            return true;
        }
    }

    //Meet with the Wizard Kirushutat
    if (current.dialog != old.dialog)
    {
        if (settings["wizard"] && current.dialog.Contains("Welcome, young man."))
        {
            return true;
        }
    }

    //Take back the Seal Crystal
    if (current.dialog != old.dialog)
    {
        if (settings["crystal"] && current.dialog.Contains("Thank you for bringing it back!"))
        {
            return true;
        }
    }

    //Retake the security and control facility
    if (current.dialog != old.dialog)
    {
        if (settings["control"] && current.dialog.Contains("Looks like you've recaptured"))
        {
            return true;
        }
    }

    //Recapture the power supply facility
    if (current.dialog != old.dialog)
    {
        if (settings["power"] && current.dialog.Contains("This is a reward for your efforts."))
        {
            return true;
        }
    }

    //Defeat the Dragons! (=EPILOGUE)
    if (current.dialog != old.dialog)
    {
        if (settings["dragons"] && current.dialog.Contains("I may be talking to a real hero."))
        {
            return true;
        }
    }
}

reset
{

}

isLoading
{
    if (current.loading == 1 && settings["gametime"])
        {
            return true;
        }
    else if (old.loading == 1 && current.loading == 0)
        {
            return false;
        }
}
