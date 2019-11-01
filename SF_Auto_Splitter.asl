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
    int gargoyles : 0x008CEB8, 0x28;
    
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
    settings.Add("option1", true, "Red Goblin");
    settings.Add("option2", false, "level 4");
    settings.Add("option3", true, "level 5");
    settings.Add("option4", false, "Malse's Gem");
    settings.Add("option5", true, "Dusty Ruins - entrance");
    settings.Add("option6", false, "Syria's Spirit Stone");    
    settings.Add("option7", true, "Dusty Ruins");
    settings.Add("option8", true, "Rosanna's Ruby");
    settings.Add("option9", true, "Cold Ruins");
    settings.Add("option10", true, "Purgatory of Judgments");
    settings.Add("option11", true, "Remains of Reincarnation");
    settings.Add("option12", true, "Continuing Land");
    settings.Add("option13", true, "Immortal Remains");
    settings.Add("option14", false, "Errand for Edo");
    settings.SetToolTip("option1", "Splits upon completing the Red Goblin quest.");
    settings.SetToolTip("option2", "Splits at lvl 4.");
    settings.SetToolTip("option3", "Splits at lvl 5.");
    settings.SetToolTip("option4", "Splits upon completing the Malse's Gem quest.");
    settings.SetToolTip("option5", "Splits upon entering the Dusty Ruins.");
    settings.SetToolTip("option6", "Splits upon completing the Syria's Spirit Stone quest.");
    settings.SetToolTip("option7", "Splits upon completing the Dusty Ruins quest.");
    settings.SetToolTip("option8", "Splits upon completing the Rosanna's ruby quest.");
    settings.SetToolTip("option9", "Splits upon completing the Cold Ruins quest.");
    settings.SetToolTip("option10", "Splits upon completing the Purgatory quest.");
    settings.SetToolTip("option11", "Splits upon completing the Reincarnation Gem quest.");
    settings.SetToolTip("option12", "Splits upon completing the Continuing land quest.");
    settings.SetToolTip("option13", "Splits upon entering the episode 1 epilogue screen.");
    settings.SetToolTip("option14", "Splits upon completing the Errand for Gedo quest.");
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
    if (settings["option1"])
    {
        if (current.dialog != old.dialog && current.dialog == "I heard the news!")
        {
            vars.dustied = false;
            return true;
        }
    }

    //SPECIAL (lvl) - lvl 4
    if (settings["option2"])
    {
        if (current.lvl != old.lvl && current.lvl == 4)
        {
            return true;
        }
    }    

    //SPECIAL (lvl) - lvl 5
    if (settings["option3"])
    {
        if (current.lvl != old.lvl && current.lvl == 5)
        {
            return true;
        }
    }

    //malse
    if (settings["option4"])
    {
        if (current.dialog != old.dialog && current.dialog == "Oh, here you are. That must be")
        {
                return true;
        }
    }

    //SPECIAL (loc) - entering dusty ruins
    if (settings["option5"])
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
    if (settings["option6"])
    {
        if (current.dialog != old.dialog && current.dialog == "!! Is that the stolen Spirit S")
        {
            return true;
        }
    }

    //dusty ruins
    if (settings["option7"])
    {
        if (current.dialog != old.dialog && current.dialog == "Well done!  This town is final")
        {
            return true;
        }
    }

    //Rosanna's ruby
    if (settings["option8"])
    {
        if (current.dialog != old.dialog && current.dialog == "That must be the memorable rub")
        {
            return true;
        }
    }

    //cold ruins
    if (settings["option9"])
    {
        if (current.dialog != old.dialog && current.dialog == "You worked really hard.")
        {
            return true;
        }
    }

    //purgatory
    if (settings["option10"])
    {
        if (current.dialog != old.dialog && current.dialog == "You made it!")
        {
            return true;
        }
    }

    //reincarnation
    if (settings["option11"])
    {
        if (current.dialog != old.dialog && current.dialog == "Thank you for your efforts.")
        {
            return true;
        }
    }

    //continuing land
    if (settings["option12"])
    {
        if (current.dialog != old.dialog && current.dialog == "Good job. Your report drew my ")
        {
            return true;
        }
    }

    /*gargoyles (not used - epilogue is about 2 seconds apart anyway)
    if (current.dialog != old.dialog)
    {
        if (current.dialog == "Great job!!")
        {
            return true;
        }
    }*/

    //epilogue (paired with the immortal remains option)
    if (settings["option13"])
    {
        if (current.dialog != old.dialog && current.dialog == "It seems that peace has been r")
        {
            vars.dustied = false;
            return true;
        }
    }

    //errand for Gedo
    if (settings["option14"])
    {
        if (current.dialog != old.dialog && current.dialog == "Oh, you brought it back like y")
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
