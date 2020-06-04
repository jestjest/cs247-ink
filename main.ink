// TODO
// Add suspicion score and check poster when digging.
// Use dig percent and tools.
// Implement guards, environment interaction, other stories.
// Add bounds for health, suspicion, dig percent.

INCLUDE prologue.ink
INCLUDE prison_start.ink
INCLUDE red_0.ink
INCLUDE red_1.ink
INCLUDE red_2.ink

VAR day = 0
VAR started_daily_quest = false

VAR goal = ""
VAR health = 100
VAR suspicion = 0
VAR remaining_night_hours = 8
VAR number_input = 0
VAR can_dig = false
VAR dig_percent = 0

VAR met_red = false
VAR red_influence = 0

LIST tools = rock_hammer, hammer, poster

-> prologue
=== prologue_end ===

-> prison_start
=== prison_end ===

-> day_phase
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
    - remaining_night_hours >= number_input && health > 5 * remaining_night_hours:
        Digging for {number_input} hours... you used up some health.
        ~ remaining_night_hours -= number_input
        ~ health -= 5 * number_input
    - remaining_night_hours < number_input:
        You don't have enough hours remaining in the night.
    - health <= 5 * remaining_night_hours:
        You don't have enough health for that.
    }
    -> night_choices
+   [Sleep] Ending the night...
    ~ health = health + remaining_night_hours
    -> day_phase

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
- tools ?! poster && goal == "Break out of prison.":
    + [Obtain a Rita Hayworth poster.]
    ~ started_daily_quest = true
    -> red_2_start
- else:
    Want a cig? Nothing better to do nowadays.
    + [Walk away.]
    -> day_phase.day_choices
}

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