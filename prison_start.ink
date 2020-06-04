// This is the prison start Ink story.

// Prison start knot.
=== prison_start ===
After many hours on the road, you arrive at the Shawshank Penitentiary. A gray, musty fog envelopes you as you step off the bus.
"I got 5 cigs on that Fat Ass crying first night!" # Passive
"Throw me in for 10, that's an easy picking!" # Passive
You are greeted by Head Warden Norton.
-*  [Continue.]
Warden Norton: This is Mr. Hadley, captain of the guards. I am Mr. Norton, the warden. You are sinners and scum, that's why they have sent you to me.
Rule number one: no blaspheming. I'll not have the Lord's name taken in vain in my prison.
-*  [Continue.]
Rule number two: at this prison, try to survive and keep your health in check. We don't want you dying in here and causing us trouble.
~ health = 100
-*  [Continue.]
Rule number three: don't be sneaking around. We know how suspicious everyone is.
~ suspicion = 0
-*  [Continue.]
Rule number four: behave yourself and you might get put on parole. Who knows. 
~ goal = "Get granted parole."
-*  [Continue.]
The other rules you'll figure out as you go along. Any other questions?
-> prison_start_rules

= prison_start_rules
*  What do we eat? # Player
    Captain Hadley slowly marches up to you. # Passive
    Captain Hadley: YOU EAT WHEN WE SAY YOU EAT! YOU
PISS WHEN WE SAY YOU PISS! YOU SHIT WHEN WE SAY YOU SHIT! YOU SLEEP WHEN WE SAY YOU SLEEP! YOU MAGGOT-DICK MOTHERFUCKER!
    ** [Meekly acknowledge.]
    -> prison_start_rules
*   When do we sleep? # Player
    Captain Hadley: When we turn off the lights and tell you so. Don't you dare do anything after the dark.
    ** [Acknowledge.]
    -> prison_start_rules
*   No sir. # Player

- Warden Norton: I believe in two things. Discipline and the Bible. Here, you'll receive both.
(holds up a Bible) # Passive
Put your faith in the Lord. Your ass belongs to me.
Welcome to Shawshank.
* [Begin to leave the room.] # Passive
Warden Norton: So... I believe you are here because you killed your wife.
    **   I never did that! # Player
        Warden Norton: Ha... Innocent? Like everyone else here, huh
        -> prison_start_ending.
    **   So what? # Player
    **   It's none of your business. # Player
    -- Warden Norton: Watch what you say here. I can let you stay here for longer or shorter... depends on how pleased I am with you. Got it?
    Suspicion increases. # Passive
    ~ suspicion = suspicion + 10
    -> prison_start_ending
= prison_start_ending
-*  [Acknowledge.]
The sun dims on the first day and everyone is corralled into their cells.
You hear someone weeping a few cells down.
Fat Ass: I wasn't meant to be here! I didn't do anything!... # Passive
Others: Anddd that's a wrap, cough up those cigs, boys! # Passive
It's going to be a long night.
-*  [Sleep.]
--> prison_end