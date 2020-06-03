INCLUDE prologue.ink
INCLUDE prison_start.ink

VAR day = 0
VAR health = 100
VAR suspicion = 0
VAR goal = ""
VAR remaining_night_hours = 8
VAR number_input = 0
VAR can_dig = false

-> prison_start
# -> prologue
=== prologue_end ===

-> prison_start
=== prison_end ===

-> day_phase
=== day_phase ===
~ day = day + 1
Day {day}.
-> day_choices
= day_choices
How will you spend it?
+   [Interact with environment.]
    Not implemented yet.
    -> day_choices
+   [Talk to someone.]
    Not implemented yet.
    -> day_choices
+   [Call it a night.] Time to go to bed. # Player
    -> night_phase
    
    
=== night_phase ===
~ remaining_night_hours = 8
Night {day}.
-> night_choices
= night_choices
    How will you spend your {remaining_night_hours} hours?  # GET-int-number_input
+   [Interact with the cell.]
    Not implemented yet.
    -> night_choices
+   { remaining_night_hours > 0 } [Talk to your cell buddy (1 hour)]
    Not implemented yet.
    ~ remaining_night_hours = remaining_night_hours - 1
    -> night_choices
+   { can_dig && remaining_night_hours > 0 } [Dig]
    {
    - remaining_night_hours >= number_input && health > 2 * remaining_night_hours:
        Digging for {number_input}...
        ~ remaining_night_hours = remaining_night_hours - number_input
        ~ health = health - 2 * remaining_night_hours
    - remaining_night_hours < number_input:
        You don't have enough hours remaining in the night.
    - health <= 2 * remaining_night_hours:
        You don't have enough health for that.
    }
    -> night_choices
+   [Sleep] Ending the night...
    ~ health = health + 2 * remaining_night_hours
    -> day_phase

The end.
-> END