// This is the prologue Ink story.

// Prologue "knot" aka scene.
=== prologue===
It's 1946, you walk into a courtroom for your trial, accused for murdering your wife.
The jury listens like a gallery of mannequins on display, pale-faced and stupefied.
You are on the witness stand, hands folded, suit and tie pressed, hair meticulously combed.
-> prologue_court

// Prologue court event.
= prologue_court
~ dig_percent = 100
Defense attorney (D.A.): describe the confrontation you had with your wife the night she was murdered.
*   It was ugly. # Player
    D.A.: How so?
    **  She went to a country club with her friend Mr. Quentin.[] I was mad that she went there without me. # Player
    **  We were having a fight[.] and she just stormed off to the country club. So I followed her. # Player

*   I was calm. # Player
    D.A.: Did you follow her to the country club with Mr. Quentin?
    **  Yes[.], I did. # Player
        D.A.: With what intention?
        ***   I'm not sure. I was confused. Drunk. # Player
        ***   I don't remember. # Player
        ***   I think mostly I wanted to scare them. # Player
    **  No[.], I was just there with friends. # Player
    
- D.A.: Did you have a gun with you? More specifically a .38 caliber?
*   Yes. # Player
    D.A.: So you confess that you murdered her and Mr. Quentin?
    **  No, I would never! # Player
        D.A.: Never confess huh?
    **  No! I was only planning to confront them and ask for a divorce. # Player
        D.A.: Ah a divorce. A .38 caliber divorce, wrapped in a handtowel to muffle the shots, isn't that what you mean? And then you shot her lover!
    --*** No! I would never murder anyone! # Player
*   No. # Player
    D.A.: But you do have a .38 caliber.
    **   Yes, but[...] I only use it for self-defense. # Player
    **   Yes. # Player
    
- 
D.A.: The cleaning lady showed up the next morning and found your wife and her lover in bed, riddled with .38 caliber bullets. 
That just strikes you as a fantastic coincidence then Mr. Dufresne?
Ladies and gentlemen, you've heard all the evidence, you know all the facts.
*   [Continue]
We have the accused at the scene of the crime. 
We have foot prints. Tire tracks.
Bullets scattered on the ground which bear his fingerprints. 
A broken bourbon bottle, likewise with fingerprints. 
Most of all, we have a beautiful young woman and her lover lying dead in each other's arms. 
-*  [Continue]
They had sinned. 
But was their crime so great as to merit a death sentence?
I suspect Mr. Dufresne's answer to that would be yes. 
I further suspect he carried out that sentence on the night of September 21st, this year of our Lord, 1946, by pumping four bullets into his wife and another four into Glenn Quentin.
And while you think about that, think about this... I'm done talking.
-*  [Continue]
You people are all decent, God-fearing Christian folk. You know what to do.
Jury: Guilty. Guilty. Guilty. Guilty...
-*  [To prison.]
-> prologue_end