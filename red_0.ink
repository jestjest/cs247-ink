=== red_0_start ===
-Red: The wife-killin' banker. Why'd you do it?
*   How did you know that? [] I didn't do it, since you asked. #Player
*   She was sleeping around.[] Let's just say I felt vindictive that night. #Player

-   Red:Hell, you'll fit right in, then.Everyone's innocent in here, don't you know that? Heywood! What are you in for, boy? 
    (Heywood yells back, "Didn't do it! Lawyer fucked me!") See?
*   I'm serious[.], I didn't really do it! #Player
    Red:Nice try, but you won't be getting anyone to believe you.
    Best to start getting situated in here, understand?
    **  Whatever, I'll find someone who takes me seriously.#Player
        ***  [Nothing gained. Relationship decreases.]
            ~like_by_Red -= 10
            ->red_0_end
    **  Fine, What else have you heard? #Player
*   What else have you heard? #Player

-   Red:People say you're a cold fish. They say you think your shit smells sweeter than ordinary. That true?
*   I'm just a man who works with numbers. #Player
*   Up to you to decide.#Player

-
Red: Whatever you say. Anyways, if you ever need anything from the outside world and have something to offer to me, I can get it in, depending on how I'm feeling that day.
*   Pleasure to do business with you.
-
*   [Relationship increases. Mental health increase a little.]
    ~like_by_Red += 10
    ~health += 5
-> red_0_end