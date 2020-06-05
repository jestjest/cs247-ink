// TODO
// Add suspicion score to digging.
// Implement guards, environment interaction, other stories and tools.

INCLUDE prologue.ink
INCLUDE prison_start.ink
INCLUDE red_0.ink
INCLUDE red_1.ink
INCLUDE red_2.ink
INCLUDE utils.ink

VAR day = 0
VAR started_daily_quest = false
VAR number_input = 0

VAR goal = ""
// Bounds: [0, 100]
VAR health = 100
// Bounds: [0, infty]
VAR suspicion = 0

// Bounds: [0, 100]
VAR dig_percent = 0
VAR remaining_night_hours = 8
VAR can_dig = false

// Bounds: [-infty, infty]
VAR red_influence = 0
VAR met_red = false

VAR has_poster = false
// List of possible tools the player can have. The value is the dig multiplier.
LIST tools = rock_hammer=1


-> prologue_start
=== prologue_end ===

-> prison_start
=== prison_end ===

-> day_phase
// Day phase where the player makes a few choices.
=== day_phase ===
~ day = day + 1
~ started_daily_quest = false
-> day_choices
= day_choices
Day {day}.
How will you spend it?
+   [Interact with environment.]
    Not implemented yet. # Passive
    -> day_choices
+   [Talk to someone.] Choose someone to talk to.
    ++  [Red]
        -> red_quests
    ++   [Guards]
        Not implemented yet. # Passive
        -> day_choices
+   [Call it a night.] Time to go to bed. # Player
    -> night_phase

// Night phase where the player makes a few choices.
=== night_phase ===
~ remaining_night_hours = 8
-> night_choices
= night_choices
Night {day}.
How will you spend your {remaining_night_hours} hours?  # GET-int-number_input
+   [Interact with the cell.]
    You notice a crack in the wall. # Passive
    {
    - tools ? rock_hammer && goal == "Get granted parole.":
        Eh? Looks like you're able to open up the crack with some of your tools. # Passive
        ~ can_dig = true
        ~ dig_percent = 0
        ~ goal = "Break out of prison."
        + [Found your true goal.]
        -> night_choices
    - tools !? rock_hammer:
        But you don't mind it... for now. # Passive
        + [Continue.]
        -> night_choices
    - else:
        Some day... you'll survive long enough to carve out your escape. Until then... # Passive
        + [Continue.]
        -> night_choices
    }
+   { remaining_night_hours > 0 } [Talk to your cell buddy (1 hour)]
    Not implemented yet. # Passive
    ~ remaining_night_hours = remaining_night_hours - 1
    -> night_choices
+   { can_dig && remaining_night_hours > 0} [Dig (enter \# of hours)]
    {
    - !has_poster:
        You won't be able to dig until you get something to cover up the hole you'll make. # Passive
        You spend an hour thinking, pacing back and forth. # Passive
        ~ remaining_night_hours -= 1
        -> night_choices
    - remaining_night_hours < number_input:
        You don't have enough hours remaining in the night. # Passive
        -> night_choices
    - health <= 5 * remaining_night_hours:
        You don't have enough health for that. # Passive
        -> night_choices
    }

    ~ temp caught_percent = min(100, number_input * POW(suspicion, 0.4))
    { caught_percent > 0: You hear the sound of thick leather shoes and batons clanging near by.} # Passive
    You will be caught by the guards with {caught_percent}% chance. Continue?
    ++ [Yes.]
        ~ temp caught = RANDOM(1, 100) <= caught_percent
        {
        - caught:
            OH NO! The guards arrived before you could fully cover up your escape route. # Passive
            They subject you to the most unimaginable pain and torture a prisoner could ever experience.
            ~ health = 0
        - else:
            Dug for {number_input} hours with a {LIST_MAX(tools)}. # Passive
            You used up some health. # Passive
            ~ remaining_night_hours -= number_input
            ~ health -= 5 * number_input
            ~ temp dig_multiplier = LIST_VALUE(LIST_MAX(tools))
            ~ dig_percent = min(100, dig_percent + number_input * dig_multiplier)
        }
    ++ [No.]
    -- -> night_choices
+   [Sleep (minimum: 3 hours)] Ending the night... # Passive
    {
    - remaining_night_hours < 3:
        ~ health = max(0, health - 2 * (5 - remaining_night_hours))
        Not having slept enough, you're less healthy for tomorrow. # Passive
    - else:
        ~ health = min(100, health + 2 * (remaining_night_hours - 2))
        You recovered a bit of energy. # Passive
    }
    -> day_phase

// Red quests menu.
=== red_quests ===
You approach Red standing in the courtyard. # Passive
{
- started_daily_quest:
    Red: You've bothered me enough today. Scram!
    + [Walk away.]
    -> day_phase.day_choices
- !met_red:
    + [Meet Red.]
    ~ started_daily_quest = true
    -> red_0_start
- tools !? rock_hammer:
    + [Try to acquire a rock hammer.]
    ~ started_daily_quest = true
    -> red_1_start
- !has_poster && goal == "Break out of prison.":
    + [Obtain a Rita Hayworth poster.]
    ~ started_daily_quest = true
    -> red_2_start
- else:
    Red: Want a cig? Nothing better to do nowadays.
    + [Walk away.]
    -> day_phase.day_choices
}

// Ending knot - the story should divert here once the game is over for some reason.
=== END ===
{
- health == 0:
    <b> You are worn down and weary.
    <b> You can't continue any longer.
    <b> It's the end of the line for you.
- dig_percent == 100:
    <b> Having dug for so long, you finally break through the last barrier of concrete.
    <b> You're not sure when they'll realize, but you've gotten the best head start you could've wished for.
    <b> Good luck out there.
}
END
-> END