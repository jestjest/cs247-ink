=== red_1_start ===
*   I understand [...]you're a man who knows how to get things. #Player
      Red: I'm known to locate certain things from time to time. They seem to fall into my hands. Maybe it's 'cause I'm Irish.
-

*   I wonder[...] if you could get me a rock-hammer? #Player
    Red: What is it and why?
-

*   [Why ask?]You make your customers' motives a  part of your business?#player
    Red: If you wanted a toothbrush, I wouldn't ask questions. I'd just quote a price. A toothbrush, see, is a non-lethal sort of object.
    Red: So can you tell me now?
    **  [Refuse] Sorry, I can say too much. #Player
        Red: Fine, you can reach out to someone else.
        -> red_1_end
    **  [Tell him] 
        -> player_explain_hammer
    ->red_1_end
*   [Tell him]   #Player
    -> player_explain_hammer

= player_explain_hammer
Fair enough. A rock-hammer is about eight or nine inches long. Looks like a miniature pickaxe, with a small sharp pick on one end, and a blunt hammerhead on the other. It's for rocks. #Player
I'm a rock hound. At least I was, in my old life. I'd like to be again, on a limited scale. #Player

*  {like_by_Red >= 10}[Red likes you.]Red: That comes free. But you understand my concern, right?  
    **  [Explain]  If there's trouble, I doubt a rock-hammer will do me any good. #Player
        Red: Then I guess you wanna escape. Tunnel under the wall maybe?
        *** [(laugh politely)] #Player
            Red: You can have the hammer.
            **** [Get the hammer] #Player
                ~get_hammer += 1
                ->red_1_end
    ->red_1_end
    
*  {like_by_Red < 10}[Red doesn't like you.]Red: I don't want to get any trouble. Or maybe plant your toy in somebody's skull?
    **  [You get nothing]
        ->red_1_end

->red_1_end