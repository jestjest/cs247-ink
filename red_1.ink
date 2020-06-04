=== red_1_start ===
+   I understand you're a man who knows how to get things. # Player
    Red: I'm known to locate certain things from time to time. They seem to fall into my hands. Maybe it's 'cause I'm Irish.
-
+   I wonder[...] if you could get me a rock-hammer? # Player
    Red: What is it and why?
-
+   [Why ask?] You make your customers' motives a part of your business? # Player
    Red: If you wanted a toothbrush, I wouldn't ask questions. I'd just quote a price. A toothbrush, see, is a non-lethal sort of object.
    Red: So can you tell me now?
    ++  [Refuse.] Sorry, I can say too much. # Player
        Red: Fine, you can reach out to someone else.
        +++ [Nothing happens.]
        -> red_1_end
    ++  [Tell him.] Fine. # Player
        -> player_explain_hammer

+   [Tell him.] Fair enough. I should be honest with you from the start. # Player
    ~ red_influence += 10
    -> player_explain_hammer

= player_explain_hammer
A rock-hammer is about eight or nine inches long. Looks like a miniature pickaxe, with a small sharp pick on one end, and a blunt hammerhead on the other. It's for rocks. # Player
I'm a rock hound. At least I was, in my old life. I'd like to be again, on a limited scale. # Player
{
    - red_influence >= 10:
        Red has taken a liking to you. # Passive
        Red: That comes free. But you understand my concern, right?
        +   [Assure safety.]  If there's trouble, I doubt a rock-hammer will do me any good. # Player
            Red: Then I guess you wanna escape. Tunnel under the wall maybe?
            ++ [Laugh politely.]
                Red: You can have the rock hammer.
                +++ [Obtain rock hammer.] # Player
                    ~ tools += rock_hammer
                    -> red_1_end
    - else:
        Red doesn't like you very much. # Passive
        Red: I don't want to get any trouble. Or maybe plant your toy in somebody's skull?
        + [You get nothing.] # Passive
        -> red_1_end
}

= red_1_end
-> day_phase.day_choices