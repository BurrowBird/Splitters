state("ShadowFlare")
{
    int redgoblin : 0x008CEB8, 0x0;
    int malse : 0x008CEB8, 0x4;
    int spiritstone : 0x008CEB8, 0x8;
    int dusty : 0x008CEB8, 0xC;
    int ruby : 0x008CEB8, 0x10;
    int gedo : 0x008CEB8, 0x14;
    int coldruins : 0x008CEB8, 0x18;
    int purgatory : 0x008CEB8, 0x1C;
    int reincarnation : 0x008CEB8, 0x20;
    int continuing : 0x008CEB8, 0x24;
    int garmains : 0x008CEB8, 0x28;
    
    string30 dialog : 0x008CE14, 0x30, 0x3C, 0x4, 0x0;
    int lvl : 0x005CA58, 0x14;
    string11 location : 0x00338FC, 0x0;
    //int position : 0x00202EC, 0x4;
    //int speech : 0x008CE14, 0x30, 0x3C, 0x4, 0x0;
    //int experience : 0x008CE10, 0x34, 0x0, 0xE8;
    
    //"position" is one of the coordinates for player position - at the start of a new game, it's always 9030
    //"location" is the string for the name of the area the player is in, inside map ("N")
}

init
{
    vars.dustied = false;
}

startup
{
    //episode 1
    settings.Add("ep1", true, "Episode 1 (Main Quests)");
    settings.Add("ep1_side", false, "Episode 1 (Side Quests)");
    settings.Add("ep2", false, "Episode 2 (Main Quests)");

    //episode 1
    settings.CurrentDefaultParent = "ep1";
    settings.Add("red", true, "Red Goblin");
    settings.Add("lvl5", true, "level 5");
    settings.Add("dustance", true, "Dusty Ruins - entrance");  
    settings.Add("dusty", true, "Dusty Ruins");
    settings.Add("ruby", true, "Rosanna's Ruby");
    settings.Add("cold", true, "Cold Ruins");
    settings.Add("purgatory", true, "Purgatory of Judgments");
    settings.Add("reincarnation", true, "Remains of Reincarnation");
    settings.Add("conland", true, "Continuing Land");
    settings.Add("garmains", true, "Immortal Remains");
    
    //episode 1 side
    settings.CurrentDefaultParent = "ep1_side";
    settings.Add("malse", true, "Malse's Gem");
    settings.Add("syria", true, "Syria's Spirit Stone");
    settings.Add("gedo", true, "Errand for Edo");

    //episode 2
    settings.CurrentDefaultParent = "ep2";
    settings.Add("thieves", true, "Thieves");
    settings.Add("gandalf", true, "You shall not pass!");
    settings.Add("wizard", true, "Meet with the Wizard Kirushutat");
    settings.Add("crystal", true, "Take back the Seal Crystal");
    settings.Add("control", true, "Retake the security and control facility");
    settings.Add("power", true, "Recapture the power supply facility");
    settings.Add("dragons", true, "Defeat the Dragons!");
    
    //tooltips
    settings.SetToolTip("ep1", "Selects episode 1 main quests.");
    settings.SetToolTip("ep1_side", "Selects episode 1 side quests.");
    settings.SetToolTip("ep2", "Selects episode 2 main quests.");
    
    settings.SetToolTip("red", "Splits upon completing the Red Goblin quest.");
    settings.SetToolTip("lvl5", "Splits at lvl 5.");
    settings.SetToolTip("malse", "Splits upon completing the Malse's Gem quest.");
    settings.SetToolTip("dustance", "Splits upon entering the Dusty Ruins.");
    settings.SetToolTip("syria", "Splits upon completing the Syria's Spirit Stone quest.");
    settings.SetToolTip("dusty", "Splits upon completing the Dusty Ruins quest.");
    settings.SetToolTip("ruby", "Splits upon completing the Rosanna's ruby quest.");
    settings.SetToolTip("cold", "Splits upon completing the Cold Ruins quest.");
    settings.SetToolTip("purgatory", "Splits upon completing the Purgatory quest.");
    settings.SetToolTip("reincarnation", "Splits upon completing the Reincarnation Gem quest.");
    settings.SetToolTip("conland", "Splits upon completing the Continuing conland quest.");
    settings.SetToolTip("garmains", "Splits upon entering the episode 1 epilogue screen.");
    settings.SetToolTip("gedo", "Splits upon completing the Errand for Gedo quest.");
    settings.SetToolTip("thieves", "Splits upon completing the 'Destroy Thieves staying SE of Kanfore' quest.");
    settings.SetToolTip("gandalf", "Splits upon being refused entrance to the elven city.");
    settings.SetToolTip("wizard", "Splits upon completing the 'Meet with the Wizard Kirushutat' quest.");
    settings.SetToolTip("crystal", "Splits upon completing the 'Take back the Seal Crystal' quest.");
    settings.SetToolTip("control", "Splits upon completing the 'Retake the security and control facility' quest.");
    settings.SetToolTip("power", "Splits upon completing the 'Recapture the power supply facility' quest.");
    settings.SetToolTip("dragons", "Splits upon completing the 'Defeat the Dragons!' quest.");
}

start
{
    if (current.lvl != old.lvl && current.lvl == 1)
    {
        vars.dustied = false;
        return true;
    }
}

split
{	
    //red goblin
    if (settings["red"])
    {
        if (current.dialog != old.dialog && current.dialog == "I heard the news!")
        {
            vars.dustied = false;
            return true;
        }
    }

    //SPECIAL (lvl) - lvl 5
    if (settings["lvl5"])
    {
        if (current.lvl != old.lvl && current.lvl == 5)
        {
            return true;
        }
    }

    //malse
    if (settings["malse"])
    {
        if (current.dialog != old.dialog && current.dialog == "Oh, here you are. That must be")
        {
                return true;
        }
    }

    //SPECIAL (loc) - entering dusty ruins
    if (settings["dustance"])
    {
        if (vars.dustied == false)
        {
            if (current.location != old.location && current.location == "Dusty Ruins")
            {
                vars.dustied = true;
                return true;
            }
        }
    }

    //spirit stone
    if (settings["syria"])
    {
        if (current.dialog != old.dialog && current.dialog == "!! Is that the stolen Spirit S")
        {
            return true;
        }
    }

    //dusty ruins
    if (settings["dusty"])
    {
        if (current.dialog != old.dialog && current.dialog == "Well done!  This town is final")
        {
            return true;
        }
    }

    //Rosanna's ruby
    if (settings["ruby"])
    {
        if (current.dialog != old.dialog && current.dialog == "That must be the memorable rub")
        {
            return true;
        }
    }

    //cold ruins
    if (settings["cold"])
    {
        if (current.dialog != old.dialog && current.dialog == "You worked really hard.")
        {
            return true;
        }
    }

    //purgatory
    if (settings["purgatory"])
    {
        if (current.dialog != old.dialog && current.dialog == "You made it!")
        {
            return true;
        }
    }

    //reincarnation
    if (settings["reincarnation"])
    {
        if (current.dialog != old.dialog && current.dialog == "Thank you for your efforts.")
        {
            return true;
        }
    }

    //continuing land
    if (settings["conland"])
    {
        if (current.dialog != old.dialog && current.dialog == "Good job. Your report drew my ")
        {
            return true;
        }
    }

    //garmains (not used since the epilogue is about 2 seconds apart anyway)
    /*
    if (current.dialog != old.dialog)
    {
        if (current.dialog == "Great job!!")
        {
            return true;
        }
    }
    */

    //epilogue (paired with the immortal garmains option)
    if (settings["garmains"])
    {
        if (current.dialog != old.dialog && current.dialog == "It seems that peace has been r")
        {
            vars.dustied = false;
            return true;
        }
    }

    //errand for Gedo
    if (settings["gedo"])
    {
        if (current.dialog != old.dialog && old.dialog == "Oh, you brought it back like y")
        {
            return true;
        }
    }

    //---------------------------- EPISODE 2 ----------------------------
    
    //Destroy Thieves staying SE of Kanfore
    if (settings["thieves"])
    {
        if (current.dialog != old.dialog && current.dialog == "First, here is a reward for yo")
        {
            return true;
        }
    }

    //Head for the mining Tunnel of Yugunos
    if (settings["gandalf"])
    {
        if (current.dialog != old.dialog && current.dialog == "Couldn't you pass through the ")
        {
            return true;
        }
    }

    //Meet with the Wizard Kirushutat
    if (settings["wizard"])
    {
        if (current.dialog != old.dialog && current.dialog == "Welcome, young man.")
        {
            return true;
        }
    }

    //Take back the Seal Crystal
    if (settings["crystal"])
    {
        if (current.dialog != old.dialog && current.dialog == "Thank you for bringing it back!")
        {
            return true;
        }
    }

    //Retake the security and control facility
    if (settings["control"])
    {
        if (current.dialog != old.dialog && current.dialog == "Looks like you've recaptured t")
        {
            return true;
        }
    }

    //Recapture the power supply facility
    if (settings["power"])
    {
        if (current.dialog != old.dialog && current.dialog == "Good job.  This is a reward for your efforts.")
        {
            return true;
        }
    }

    //Defeat the Dragons! (=EPILOGUE)
    if (settings["dragons"])
    {
        if (current.dialog != old.dialog && current.dialog == "I may be talking to a real hero.")
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

}
