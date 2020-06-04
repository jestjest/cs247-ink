=== red_2_start ===
+   Can we talk about business? # Player
    Red: Sure. What do you want?
-
+   Rita Hayworth. Can you get her? # Player
    Red: No problem. But it's the hottest item in this place. The price is not low.
-
+   How much? # Player
    Red: It's not about the money.
-
{
- tools ? rock_hammer:
    You show Red your rock hammer. # Passive
    Red: you have a hammer. You said you are a rock hound. Can you make some chess pieces?
    +   [Accept] Deal. # Player
        You lose 5 health value making chess.
        ~ health -= 5
        -> poster_deal_done
    ++  [Refuse] I don't think Rita Hayworth is worth it. # Player
        Red: Fine. There is nothing to talk about then.
        -> red_2_end
- else:
    You don't have tools to help Red. # Passive
    Red: My friends and I need some laundry to do. It will be great if someone can help.
    +  [Refuse] That's your own business. # Player
        Red: Fine. There is nothing to talk about then.
        -> red_2_end
    +  [Accept] Deal. # Player
        ++ You lose 30 health value doing laundry.
        ~ health -= 30
        -> poster_deal_done
}
= poster_deal_done
+   You get the poster.
    ~ has_poster = true
    -> red_2_end
    
= red_2_end
-> day_phase.day_choices