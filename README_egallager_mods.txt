This one got hard eventually; the original author (szopen) seemed to assume that
the player would do a better job keeping their units alive than I did. Actually,
the author seemed to make a lot of assumptions about player behavior that didn't
necessarily hold true in general. I might have to take some more passes at this,
as there's a lot of other cleanups to be done, too, which can be found in the
repository's GitHub issue tracker.

Anyways, here are my per-scenario notes:

01 Breaking the Circle: gold/income tweaks, replace commenting-out of code with
  ifdef-ing out of code (and removal), simplification of conditionals, add
  "assassin" micro AI to the assassin, add message captions, change some portraits,
  make some changes for debugging, additional translation comments, dialogue
  updates, handle loyal units better, have Gawen actually use the poisoned status
  when he is poisoned.
02 Fighting for Passage: tweaks to gold and turns, vary turns on which enemy 
  leader is passive by difficulty, tweak AI parameters, and simplify conditionals.
  I also did some funky stuff with the income levels, so that Gawen gets more gold
  when he is not standing on a keep, and Raul's income increases with the logarithm
  of the turn number. I also added the AI Controller to let the player try to
  control their allied AI, so that it wouldn't steal kills (and thus EXP) as much.
  This meant I had to give the allied AI a leader, too, for the AI controller to
  work, but I managed to keep that from affecting the balance too much by making
  that leader ignore keeps, so that I don't have to worry about recruiting or
  anything. I only went with this fallback option of adding the AI controller
  because I didn't know how to write a custom AI to prevent killstealing as
  CelticMinstrel had originally suggested. Anyways, I also added the "assassin"
  micro AI here, too, as I did in the first scenario, but that does not usually get
  tested here, as I usually have already killed the assassin in the first scenario
  by the time I get here. One more thing I did was to vary Reme's tip about
  Shieldguards and Protectors by the time of day. Also, with all the additional
  gold Gawen gets now due to my weird income formulae, I also added an event to
  give Raul guards when he gets attacked, so he doesn't die as quickly (the number
  of guards here may need some further tweaking). One more thing I tried that might
  need further work is the loyalty check for the dialogue that plays when a
  clansman dies, in an attempt to make the dialogue different for loyal clansmen.
  Getting the filter right for it has been somewhat tricky; see issue 23 on
  GitHub. Also, Lorin now gets experience for examining the gallows, and cutscene
  animations should be improved.
03 Coronation: Story only; only major changes are a terrain fix, and team coloring
  for kneeling Akladian Lords
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
  leave behind some warriors upon fleeing, and addressed some situations that can
  arise when using debug mode. For porting to BfW 1.16, I split up some messages to
  make the player pay more attention, tweaked enemy AI further, made Uri van Roe's
  attack on Barnon work better and include more units, edited some debug messages,
  and added an easter egg. The code for this scenario is getting so long that it is
  getting kind of hard to summarize new changes to it now...
05 The Swamp Things: ADVICES.txt says that this scenario is not supposed to be
  hard, and that it is "easily winnable with proper tactics (and enough high-level
  loyal akladians)". Well guess what, on my first playthrough, I didn't have enough
  high-level loyal Akladians. Or any leftover Akladians, for that matter. Or even
  any gold. This is one of those examples of what I was talking about when I
  previously said that the original author (szopen) made incorrect assumptions
  about player performance. If I don't have as many recalls or as much gold as an
  author is expecting me to have to be able to complete a scenario, I'm generally
  not going to go back and replay previous scenarios to try to do better (as Reme
  hints at doing), I'm just going to edit the offending scenario until it's easy
  enough for me to complete with my current save status. My opinion is that all
  campaigns should be balanced for the worst-case scenario where the player comes
  into the scenario (heh, other sense of the word) with an empty recall list and
  no gold carryover, at least on EASY, and possibly also on NORMAL in campaigns
  with 4 or more difficulties. Anyways, as for my actual changes to this scenario,
  they were a mixture of gold/turns tweaks, plus using the
  LIMIT_CONTEMPORANEOUS_RECRUITS macro, plus reducing AI aggression
  (along with other AI tweaks), plus addition of L0 saurians.
05 Unexpected Guests: When I finally did a playthru where I chose this branching
  path, I had much more gold left over from the Battle of Barnon, so I didn't have
  to change this one as much. I did take some advice from Konrad2 on the forums,
  though, and I added fog to make the "sighted" event work. For porting to BfW
  1.16, I switched up the music a bit, improved some cutscenes, and modified the
  orcish AI a bit to make it clearer that one side is supposed to be aggressive but
  stupid, while the other is supposed to be cautious but smart.
06 Separation: mostly just copyediting
07 Ally From the Past: simplified conditionals, gold tweaks, copyediting, message
  captions, gave Ruvio and Karen additional traits, gave enemy Akladians traits,
  modified enemy AI
08 Outlaw Base: Gold tweaks, copyediting, switch commenting-out of code to
  ifdef-ing it out instead, add message captions, allow a Peasant to gain a horse
09 Hired Swords: Gold/income tweaks, copyediting, add a few additional lines of
  dialogue to clear up inconsistencies left over from the Khalifate-to-Dunefolk
  renaming, add message captions, add some additional story images, simplify
  Reumario's side swap code
10 Siege of Haeltin: gold/income tweaks, vary STARTING_VILLAGES radius with
  difficulty, other misc. changes (e.g. copyediting and message captions), add
  additional fortifications on EASY, add snowshoes (2 plus a 3rd for Reumario),
  ensure Lorin knows race of unit she's killing, add a wild boar that Reumario can
  sacrifice for experience, update list of Dunefolk units that can become loyal
11 Council in Freetown: copyediting, and added message captions, ensure elves'
  abilities persist after advancing
12 Leaving Raedwood: turns/gold/income tweaks, use LIMIT_CONTEMPORANEOUS_RECRUITS,
  add code to address how only one leader has an interrogation, add snowshoes,
  adjust recruitment pattern
13 Scouting: copyediting, message captions, address some issues with nonlinearity,
  add additional assistance dialogue from Ruvio at camp, add tools for debugging
  of dialogue messages
14a Scouting Near Barnon: copyediting, turns/gold/income tweaks, simplify ifdefs,
  message captions, allow undoing if choosing not to withdraw at the signpost, vary
  loot amounts by difficulty, add snowshoes
14b Bontom: copyediting, message captions, turns/gold/income tweaks, simplify
  ifdefs, vary price for paying for Reme by difficulty, allow undo at signpost, 
  correct wording of quote from book, vary loot amounts by difficulty, adjust
  bandit recruit lists and AI, use LIMIT_CONTEMPORANEOUS_RECRUITS, vary starting
  villages radii by difficulty, add snowshoes, adjust enemy AI further, add a few
  extra messages, improve code for basic healing ability
14c She-Wolf of Haeltin: copyediting, heal Lorin from her previous scenario
14d Avenging Ruen: I forget my first pass... subsequent passes included turns
  tweaks, message captions, allowing undoing at the signpost, addition of
  snowshoes, and updated recruitment patterns
14e Saorduc Swamps: vary lizard gold amounts by difficulty, turns/gold/incomes
  tweaks, vary starting villages radii by difficulty, saurian AI tweaks, modify
  the terrain a bit on EASY (extra villages and road), copyediting, add an event
  on EASY that causes the saurians to get nerfed by the cold, allow undoing at
  the signpost, add message captions, add additional dialogue, add snowshoes, add
  L0 saurians
15 Back in Freetown: copyediting, message captions
15a The Preparations: message captions
15b Repelling the Orcs: gold/income tweaks, one additional message caption, update
  orcish recruitment pattern
15c Raedwood East: new scenario!
16 Choosing the Best: copyediting, add additional note to warn about unrecalled
  troops, vary number of troops to recall by difficulty, have Reumario be
  recalled like Reme, Lorin's haircut now ought to persist, Kyobaine now reverts
  to her usual clothing if she got winter clothes sometime previously, and I did
  some minor dialogue updates
17 Sneaking out of Raedwood: I forget my first pass... second pass included
  copyediting, message captions, varying AI params by difficulty, turns/gold
  tweaks, and more. I also made the side that hates forests avoid them entirely
  on EASY, simplified some ifdefs, used LIMIT_CONTEMPORANEOUS_RECRUITS, varied
  some loot amounts by difficulty, recalled Reumario, added some code to assist in
  debugging Raban Harnen's interrogation, handled the change to the previous
  scenario to vary the number of recalled troops by difficulty, and added a choice
  for stealthy vs. violent strategies (which provide different modifications).
18 Start of the Quest: copyediting, vary Hans's experience by difficulty, clarify
  about how only one route to Okladia can be picked, and the difference between
  them (hills vs. forest), dialogue tweaks, update names of findable units
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
  available recruits could be recruited. Additional changes: recall Reumario, add
  wolves_multipacks MAI, have some of the burnt villages be unburnt on EASY, have
  allied AI attempt to avoid water, other misc. additional AI tweaks, clarify that
  Matthias Ramon can die (and add some events involving him), give Matthias Ramon
  and Fat Bart traits, adjust recruitment patterns, give enemies gold if your
  allied AI side kills enemy leaders, commentary updates, Matthias Ramon can now
  heal (a bit), translation notes updates, etc.
20 Okladia: copyediting, vary gold amounts with difficulty, give Deorien extra
  traits on EASY
21a Abducted Bride: I gave the player consolation units for any missing recalls
  they might have, and also added some extra villages. On a second pass I
  added message captions, and... that was pretty much it the second time.
  On a third pass, since I had Elorain this time, I tried making her faster, so
  as to reach the peasant girl more quickly.
21b Haunted Place: gold/income tweaks, AI tweaks, adjusted the recruitment pattern
  to get the AI to recruit more than just Revenants, simplification of ifdefs,
  message captions, allow undoing at the signpost, vary loot amount by difficulty,
  add Souls from Default L0 Era for undead to recruit, adjusted recruitment pattern
  even further, make map look spookier, more AI tweaks, enemy ghosts now spawn when
  exploring, Mal-Ulrival will now retreat to the northern keep when attacked,
  Mal-Ulrival now has a unique artifact that makes its wielder more powerful
  (which Deorien can pick up), dialogue and commentary updates
21c Ruins of the Past: minor copyediting, give Maurice & Alarice traits on EASY,
  add an additional story image
21d Ruins of Weldyn: minor copyediting, give Maurice & Alarice traits on EASY
22 Leaving Okladia: First pass: lots of tweaks; hard to summarize. Second pass:
  copyediting, message captions, minor gold tweak, update commentary. Subsequent
  passes: Give Rauke gold when converting him, make it easier for Gawen to make it
  back to base after converting Rauke, adjust recruitment patterns, add moveto
  event for signpost...
23 Trapped: First pass: made it easier to hire the Dunefolk, and made it more
  rewarding to do so. Second pass: copyediting, message captions, simplify ifdefs,
  fix indentation, and... yeah I think that's it. Subsequent passes: adjust map,
  adjust dialogue, adjust recruitment patterns
24 Fall of Freetown: copyediting, message captions
25 The Awakening: Gave the AI some other goals besides just targeting Gawen,
  to prevent Huon from getting to their leaders before you do. That was on my
  first pass, at least. On my second pass, I did copyediting, message captions,
  gave gold for capturing villages to go along with the peasants, tweaked the AI
  even further and added the AI controller, fixed up some unit creation
  coordinates, gave Huon an extra village, gave Huon extra gold when he loses
  units, prevented Huon from moving outside his keep, and gave Huon some extra
  gold and peasants when attacked. Changes from subsequent passes: adjust
  recruitment patterns, add wolves_multipacks MAI, add animations for when peasants
  give gold, add debugging utilities for peasant spawn events, update recruitment
  patterns, etc.
26 Return of the King: copyediting, message captions
27 Orannon: First pass: prevent Mal-Raylal from reviving on EASY; lots of other
  changes, too. Second pass: message captions, tweak recruitment patterns, give
  Huon gold when he's attacked, allow units to destroy bridges, give player more
  favorable terrain. Subsequent passes: adjust recruitment patterns, give Robert
  the Hefty traits, let Mal-Raylal recruit Souls (see S21b), adjust zombie traits,
  let more tiles turn into favorable terrain, adjust screen color change, add some
  additional pseudo-interrogations
28 Lorin: copyediting, message captions
29 Epilogue: minor copyediting, moved end_text here and modified it

Also, I forget which scenario this was (S19c: The Oracle, perhaps?), but there
was a point in the campaign where you were reduced to only being able to recruit
peasants, and I got tired of that and added back the ability to recruit fencers
earlier than was intended, so now I'll probably want to edit a message in
S24 (Fall of Freetown) to reflect that (I didn't do that my first time thru
though, because it's a story-only scenario)

Note that some of my edits to this set of contributions took place in
separate repos before I decided to contribute them back upstream. The first set
of these edits were in my general wesnoth_mods repo, the link for which is here:
https://github.com/cooljeanius/wesnoth_mods/tree/master/campaigns/A_New_Order
The second set was in my own "A New Order" repo, which I started from scratch
with a fresh history, the link for which is here:
https://github.com/cooljeanius/A_New_Order
After completing my edits there, I then forked Yumi/nemaara's "A New Order" repo
and copied my changes over to my forked version, which I then submitted as a pull
request.
