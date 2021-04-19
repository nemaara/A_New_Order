This one got hard eventually; the author seemed to assume that the player
would do a better job keeping their units alive than I did. Actually, the
author seemed to make a lot of assumptions about player behavior that didn't
necessarily hold true in general. I might have to take a second pass at this,
as there's a lot of other cleanups to be done, too:

 - switching commenting-out of code to ifdef-ing out of code, or just removing
   it (done!)
 - "Khalifate" to "Dunefolk" renaming (done!)
 - varying more quantities by difficulty (done!)
 - general copyediting of text (it's mostly pretty well-written for a work
   authored by a non-native English speaker, but there's a lot of text, and
   typos slip thru...)
 - ensuring all calls to {MESSAGE} use the CAPTION_TEXT parameter when relevant
   (done with all the easy-to-fix ones; some of the harder-to-fix ones still
   remain, though)

Anyways, here are my per-scenario notes:

01 Breaking the Circle: gold/income tweaks, replace commenting-out of code with
  ifdef-ing out of code (and removal), simplification of conditionals, add
  "assassin" micro AI to the assassin, add message captions.
02 Fighting for Passage: tweaks to gold and turns, vary turns on which enemy 
  leader is passive by difficulty, tweak AI parameters, and simplify conditionals.
  I also did some funky stuff with the income levels, so that Gawen gets more gold
  when he's not standing on a keep, and Raul's income increases with the logarithm
  of the turn number. I also added the AI Controller to let the player try to
  control their allied AI, so that it wouldn't steal kills (and thus EXP) as much.
  This meant I had to give the allied AI a leader, too, for the AI controller to
  work, but I managed to keep that from affecting the balance too much by making
  that leader ignore keeps, so that I don't have to worry about recruiting or
  anything. I only went with this fallback option of adding the AI controller
  because I didn't know how to write a custom AI to prevent killstealing as
  CelticMinstrel had originally suggested. Anyways, I also added the "assassin"
  micro AI here, too, as I did in the first scenario, but I did not test that here,
  as I had already killed the assassin in the first scenario. One more thing I did
  was to vary Reme's tip about Shieldguards and Protectors by the time of day.
  Also, with all the additional gold Gawen gets now due to my weird income
  formulae, I also added an event to give Raul guards when he's attacked, so he
  doesn't die as quickly (the number of guards here may need some further
  tweaking). Finally, one thing I tried that doesn't work yet is to add a loyalty
  check for the dialogue that plays when a clansman dies, in an attempt to make
  the dialogue different for loyal clansmen. Unfortunately the "die" event might
  be too late to make that sort of check, though...
03 Coronation: Story only, no major changes.
04 Battle of Barnon: Lots of changes here... I varied some starting village radii
  by difficulty, but not the ones for which it would be spoilers to do so, though.
  Also, I simplified some ifdefs by using the {ON_DIFFICULTY} macro instead,
  switched some commented-out code to be ifdef-ed out instead, edited the dialogue,
  clarified some text about how the gold bonus/carryover works, switched the
  ifdef-ed out events that punished the player for approaching Bor Cryne and
  Uri van Roe to punish the player for directly attacking them instead, and only
  after they have been warned about approaching them, gave the player some extra
  castle and keep tiles on EASY, refunded the player the cost of evacuated loyal
  units, made Lorin's gold bonus a bit bigger, updated Hoyre's AI, added an event
  similar to S02's where the enemy's incomes get increased each turn, had Hoyre
  leave behind some warriors upon fleeing, and... yeah, I think that's about it.
05 The Swamp Things: ADVICES.txt says it's not supposed to be hard, and that
  it's "easily winnable with proper tactics (and enough high-level loyal
  akladians)". Well guess what, I didn't have enough high-level loyal
  Akladians. Or any leftover Akladians, for that matter. Or even any gold.
  This is one of those examples of what I'm talking about when I say the author
  makes incorrect assumptions about player performance. If I don't have as many
  recalls or as much gold as an author is expecting me to have to be able to
  complete a scenario, I'm not going to go back and replay previous scenarios
  to try to do better, I'm just going to edit the offending scenario until it's
  easy enough for me to complete with my current save status. My opinion is
  that all campaigns should be balanced for the worst-case scenario where the
  player comes into the scenario (heh, other sense of the word) with an empty
  recall list and no gold carryover, at least on EASY. Anyways, as for my
  actual changes to this scenario, it was a mixture of gold/turns tweaks, plus
  using the LIMIT_CONTEMPORANEOUS_RECRUITS macro, plus reducing AI aggression
  (along with other AI tweaks).
05 Unexpected Guests: When I finally did a playthru where I chose this branching
  path, I had much more gold left over from the Battle of Barnon, so I didn't have
  to change this one as much. I did take some advice from Konrad2 on the forums,
  though, and I added fog to make the "sighted" event work.
06 Separation: just copyediting
07 Ally From the Past: simplified conditionals, gold tweaks, copyediting, message
  captions
08 Outlaw Base: Gold tweaks, copyediting, switch commenting-out of code to
  ifdef-ing it out instead, add message captions
09 Hired Swords: Gold/income tweaks, copyediting, add a few additional lines of
  dialogue to clear up inconsistencies left over from the Khalifate-to-Dunefolk
  renaming, add message captions
10 Siege of Haeltin: gold/income tweaks, vary STARTING_VILLAGES radius with
  difficulty, other misc. changes (e.g. copyediting and message captions)
11 Council in Freetown: copyediting, and added message captions
12 Leaving Raedwood: turns/gold/income tweaks
13 Scouting: copyediting, message captions
14a Scouting Near Barnon: copyediting, turns/gold/income tweaks, simplify ifdefs,
  message captions, allow undoing if choosing not to withdraw at the signpost, vary
  loot amounts by difficulty
14b Bontom: copyediting, message captions, turns/gold/income tweaks, simplify
  ifdefs, vary price for paying for Reme by difficulty, allow undo at signpost, 
  correct wording of quote from book, vary loot amounts by difficulty, adjust
  bandit recruit lists and AI, use LIMIT_CONTEMPORANEOUS_RECRUITS, vary starting
  villages radii by difficulty
14c She-Wolf of Haeltin: copyediting
14d Avenging Ruen: I forget my first pass... second pass included turns tweaks,
  message captions, and allowing undoing at the signpost
14e Saorduc Swamps: vary lizard gold amounts by difficulty, turns/gold/incomes
  tweaks, vary starting villages radii by difficulty, saurian AI tweaks, modify
  the terrain a bit on EASY (extra villages and road), copyediting, add an event
  on EASY that causes the saurians to get nerfed by the cold, allow undoing at
  the signpost, add message captions
15 Back in Freetown: copyediting, message captions
15a The Preparations: message captions
15b Repelling the Orcs: gold/income tweaks, one additional message caption
16 Choosing the Best: copyediting, add additional note to warn about unrecalled
  troops
17 Sneaking out of Raedwood: I forget my first pass... second pass included
  copyediting, message captions, varying AI params by difficulty, turns/gold
  tweaks, and more. I also made the side that hates forests avoid them entirely
  on EASY, simplified some ifdefs, used LIMIT_CONTEMPORANEOUS_RECRUITS, varied
  some loot amounts by difficulty, and, um... yeah, I think that's it.
18 Start of the Quest: copyediting, vary Hans's experience by difficulty, clarify
  about how only one route to Okladia can be picked, and the difference between
  them (hills vs. forest)
19a The Woods of Okladia: I think this was around where enemy sides started
  to get Wondermen, and since they are extremely deadly, I had to put a limit
  on them, and let the enemy Akladians recruit Holymen as an alternate healer
  instead. (I also did likewise in later scenarios)
19b Entering Okladia: Tried to do the same changes as in 19a here as well
19c The Oracle: I varied all the starting units' hitpoints and experience with
  difficulty on my first pass. On my second pass I did copyediting, added message
  captions, and tweaked the turns. On a third pass I allowed the Oracle's forces
  to recruit City Militia (since I was kind of disappointed they weren't used
  more throughout the campaign), and adjusted recruitment patterns to ensure all
  available recruits could be recruited. 
20 Okladia: copyediting, vary gold amounts with difficulty, give Deorien extra
  traits on EASY
21a Abducted Bride: I gave the player consolation units for any missing recalls
  they might have, and also added some extra villages. On a second pass I
  added message captions, and... that was pretty much it the second time.
  On a third pass, since I had Elorain this time, I tried making her faster, so
  as to reach the peasant girl more quickly.
21b Haunted Place: gold/income tweaks, AI tweaks, adjusted the recruitment pattern
  to get the AI to recruit more than just Revenants, simplification of ifdefs,
  message captions, allow undoing at the signpost, vary loot amount by difficulty
21c Ruins of the Past: minor copyediting, give Maurice & Alarice traits on EASY
21d Ruins of Weldyn: minor copyediting, give Maurice & Alarice traits on EASY
22 Leaving Okladia: First pass: lots of tweaks; hard to summarize. Second pass:
  copyediting, message captions, minor gold tweak, update commentary
23 Trapped: First pass: made it easier to hire the Dunefolk, and made it more
  rewarding to do so. Second pass: copyediting, message captions, simplify ifdefs,
  fix indentation, and... yeah I think that's it.
24 Fall of Freetown: copyediting, message captions
25 The Awakening: Gave the AI some other goals besides just targeting Gawen,
  to prevent Huon from getting to their leaders before you do. That was on my
  first pass, at least. On my second pass, I did copyediting, message captions,
  gave gold for capturing villages to go along with the peasants, tweaked the AI
  even further and added the AI controller, fixed up some unit creation
  coordinates, gave Huon an extra village, gave Huon extra gold when he loses
  units, prevented Huon from moving outside his keep, and gave Huon some extra
  gold and peasants when attacked.
26 Return of the King: copyediting, message captions
27 Orannon: First pass: prevent Mal-Raylal from reviving on EASY; lots of other
  changes, too. Second pass: message captions, tweak recruitment patterns, give
  Huon gold when he's attacked, allow units to destroy bridges, give player more
  favorable terrain.
28 Lorin: copyediting, message captions
29 Epilogue: minor copyediting

Also, I forget which scenario this was (S19c: The Oracle, perhaps?), but there
was a point in the campaign where you were reduced to only being able to recruit
peasants, and I got tired of that and added back the ability to recruit fencers
earlier than was intended, so now I'll probably want to edit a message in
S24 (Fall of Freetown) to reflect that (I didn't do that my first time thru
though, because it's a story-only scenario)

Note that some of my edits to this fork took place in a separate repo before I
decided to make it a separate add-on. These edits were in my general
wesnoth_mods repo, the link for which is here:
https://github.com/cooljeanius/wesnoth_mods/tree/master/campaigns/A_New_Order
