## **Mass Salvage Assist - Version 1.0.28 - February 10th, 2026**

*Compatibility with 12.0.1 is out*

* Fixed the timer to actual show the countdown now. Sorry about that. Forgot to pass the values for localization here properly.

## **Mass Salvage Assist - Version 1.0.27 - February 8th, 2026**

***QUALITY OF LIFE***

* Added Localization for all the supported built-in languages. This includes the following:
    * English
    * Spanish (Mexico/Latin America)
    * Spanish (Spain)
    * Portuguese (Brazil)
    * French (France)
    * Italian
    * German
    * Russian
    * Korean
    * Chinese (Traditional - Taiwan/Hong Kong)
    * Chinese (Simplified - Mainland China)

*Please note, I used Gemini 3.0 to assist in the translation of all 11 of these. I requested the AI to not make it overly formal and to keep it to the same tone and style as the English, but I have no idea how good it was at this job. If you have any localization change suggestions, feel free to make a Pull Request on GitHub, or message me directly on Discord with the changes and I will be sure to implement it.

***BUG FIXES***

* Fixed a bug that could cause a LUA error if crafting was interrupted early. This shouldn't happen anymore.


## **Mass Salvage Assist - Version 1.0.26 - January 20th, 2026**

*Midnight Compatibility Update*


## **Mass Salvage Assist - Version 1.0.25 - December 2nd, 2025**

*11.2.7 Compatibility Update*


## **Mass Salvage Assist - Version 1.0.24 - October 10th, 2025**

*11.2.5 Compatibility Update*

Sorry about the delay, I didn't realize 11.2.5 was dropping this week! There wasn't much else to add.


## **Mass Salvage Assist - Version 1.0.23 - September 24th, 2025**

***BUG FIX***

* Crafting like with Thaumaturgy was causing a Lua error to trigger due to a change in a previous update. This should no longer happen. Some people reported that crafting keeps failing over and over but I was not able to recreate that, but maybe it's cause I fixed the error too soon, so please let me know. Thanks!


## **Mass Salvage Assist - Version 1.0.22 - September 23rd, 2025**

**Quality of Life Feature - Reagent quality protection**

There is a known issue with Blizz's default frames that for some reason, when tabbing around and swapping tabs, occasionally your selected secondary required reagents would just switch on their own, like move from R3 Bismuth, to R2 Bismuth when crushing, automatically. This can happen with MSA installed or not. For example, in some instances you can trigger it by swapping between the crafting window and the specialization window and boom, R2 out of nowhere. Before you know it, you just crafted a ton of lower quality items maybe you didn't want.

Well, MSA will now actively monitor the current nonstop crafting session and snapshot the Tier being used when starting, and if it deviates during crafting, either moving to a higher tier, or moving to a lower tier, crafting will immediately stop on its own and inform you that the selected quality has changed in the middle of crafting.


## **Mass Salvage Assist - Version 1.0.21 - August 28th, 2025**

* Added a new setting on the timer to now trigger a desktop icon flash if you are tabbed out of the game and you go AFK or are logging off. Configure it how you want.

![Desktop Icon Flash](https://i.imgur.com/PcLyAuh.jpeg)


## **Mass Salvage Assist - Version 1.0.20 - August 6th, 2025**

* Compatibility Release - 11.2

## **Mass Salvage Assist - Version 1.0.19 - June 24th, 2025**

* Compatibility Release - 11.1.7

**NEW FEATURE - Thanks to @SteelWebWorks on Github**

* Support for everburning ignition for blacksmiths. Crafting will now automatically stop if expired. A checkbox has been added to enable/disable.

Thanks @SteelWebWorks!

## **Mass Salvage Assist - Version 1.0.18 - April 22nd, 2025**

* Compatibility Release - 11.1.5

## **Mass Salvage Assist - Version 1.0.17 - April 14th, 2025**

* Fixed a slight bug that will happen when at the end of salvaging duel item recipes and there is no stacks left.

* Fixed a messaging error where it was not formatting a string correctly including the name of the reagent when you ran out of the 2ndary reagent for salvaging recipes that use 2 reagents, like JC Crushing.

## **Mass Salvage Assist - Version 1.0.16 - Feb 26th, 2025**

* Updated the .toc for 11.1 compatibility - Oops! missed that. Thanks @Finegorko


## **Mass Salvage Assist - Version 1.0.15 - Feb 26th, 2025**

**Compatibilty Release - 11.1**

*Please note, I will be adding some quality of life settings updates soon, just been occupied with another one of my addons. I noticed some annoying things I want to clean up. Possibly some other bug fixes too. keep the reports coming to discord. RL is a bit busy atm, so I will get to it when I have time, but I will at least get to it eventually. TY!*

* Oh and, I added the addon sorting category to be Professions, where you will find Mass Salvage Assist now.


## **Mass Salvage Assist - Version 1.0.14 - Jan 24th, 2025**

***NEW SETTINGS CHOICES AND DESIGN***

* AFK alert sound on/off toggles added

* Serttings popout window is mouseover and a little cleaner. You can freeze it by clicking '>' button, but you don't need to.

![AFK Timer Settings](https://i.imgur.com/vSKJPJL.jpeg)

***BUG FIXES***

* After the 20 second offline countdown AFK timer starts, when you hit cancel, in some cases the "Craft nonstop" checkbox would disappear until you clicked to another recipe and back to the one you were doing. This should now properly keep the checkbox visible.


## **Mass Salvage Assist - Version 1.0.13 - Jan 9th, 2025

*Update on the AFK Alert - Added an option to bypass sound being disabled.I would rather be crafting silent in the background and the ONLY sound I hear is the alert. You can choose to bypass or to not. It will bypass both the Effects being disabled (Ctrl-s) or even if all sound is disbaled.*

## **Mass Salvage Assist - Version 1.0.12 - Jan 8th, 2025

***NEW FEATURE***

**AFK ALERT**

!["AFK Alert](https://i.imgur.com/yEH8yrx.jpeg)

* Feature can be enabled and disabled.
* Bell sound when player goes AFK (but only when mass salvaging)
* Raid Alert sound when the 20 second countdown to being kicked offline appears (but only if crafting)

***BUG FIXES***

* Issue with bags not stacking properly and crafting ending prematurely with certain alchemy recipes, notably ones that used items that stacked only to 200. This was slightly overlooked as reagent types all stack to 1000... except in some recipes you salvage potions that stack only to 200. This should now function properly.

* Weird anomaly as well when crafting with non-salvage-type reagents. Very few recipes affected by this, but it would have caused crafting failure in many cases for certain crafting recipes.

* These same types of recipes should now work with slash commands. Slash command as a result will also be more accurate in the included itemID by not just determinining it is a valid reagent type to salvage, but instead, comparing its item_ID against the table of all valid items for that recipe.


## **Mass Salvage Assist - Version 1.0.11 - Dec 18th, 2024

*Compatibility Release - 11.0.7*

**IMPORTANT NOTE** - Holidays are a bit busy so it has been hard for me to get to "building" out features again due to RL busyness. Come January things will go back to normal with speedier results. Thank you for understanding!

## **Mass Salvage Assist - Version 1.0.10 - Dec 5th, 2024

***QUALITY OF LIFE***

* You now can set TWW Enchanting to only allow crafting if Shattered Essence buff is active. If the buff expires, you can now choose to have MSA auto-stop crafting immediately. You also have the option to sound a bell when the buff expires. These options are found on the shattered essence spell. TY @klemmchr on Github for a starting point and PR here!

* The Timer button has been slightly adjusted so its positioning is tweaked and a better gap between text is given, and it is more aligned with the popular CraftSim addon in placement.

**BUG REPORTS**

* Removed an error trace printout message that would occur when bags were restacking items


## **Mass Salvage Assist - Version 1.0.9 - Nov 10th, 2024

**NEW FEATURE**

* Added the `/msa resume` feature. If your crafting is interrupted for whatever reason, this will just continue where you left off, no matter the profession recipe or item you are salvaging. Whether you start the crafting by using a macro/slash command, or you start the crafting from the profession window, it doesn't matter. You can then just type `/msa resume` to continue.

**QUALITY OF LIFE**

* Added some messaging to the slash command so if you are out of items in your bags and you try to use the slash command/macro, it will inform you rather than just not saying anything.

**BUG FIXES**

* Fixed a bug where if you manually selected a stack in your bank tab, whilst still having a small stack that was too small within your bags, it would get stuck in a loop trying to stack, except it couldn't stack. This will no longer happen. In addition, the addon will inform you if you erroneously selected something not in your bags now.


## **Mass Salvage Assist - Version 1.0.8 - Nov 7th, 2024

**A NOTE ON DISTRIBUTION OF THIS ADDON, AND MY LEGAL LICENSING**

I Added a License to this as I was approached by an entity who wanted to incorporate it into a paid addon that exists out there (I will refrain from naming). I have no plans to ever allow distribution of this wrapped within a paid addon. I appreciate they at least asked. All rights reserved to myself, the addon developer and sole creator, and I will keep it freely open to all, though I retain the rights of distribution through the channels I see fit as an open source and free addon. If you wish to incorporate some aspects of this into your FREE and openly available addon, I am a pretty fair-minded individual who tends to lean towards supporting things that are of a greater benefit for us all, hence why I even released this addon publicly and did not quietly keep this to myself for an economic advantage within the game. But, I do wish to be contacted regarding so. In addition, If there are  features you would wish to add to this, I am more than happy to consider any pull requests on GitHub. You can find the Github page here: [https://github.com/TheGeneticsGuy/Mass_Salvage_Assist](https://github.com/TheGeneticsGuy/Mass_Salvage_Assist). Thank you for listening, and hopefully for your understanding!

***QUALITY OF LIFE and BUG FIXES***

*I spent an immense amount of time just trying to break crafting here, and I found a number of ways to do it. For example, let's say you are crafting, but then you decide to wander your professions recipes. Well, before, this could interrupt your restacking because you were no longer focused on the right recipe page. This will now take that into account by using. There were probably about half a dozen other ways I found you could erroneously break the nonstop crafting, restacking, and refreshing of the creal all count and I adapted all of them so they will not be an issue. In other words, the addon won't be as sensitive to craft interruption through just normal user behavior. I probably didn't find all of them, but it's a start.*

* No matter the profession, if it's a salvage spell, it will be compatible. Universal compatibility has now been built into this, allowing it to also be future proof for updates or expansion releases that drop new salvaging recipes.

* Fixed an issue where the checkbox on the timer for only calculating based on items in bags would disappear and reapper whilst you were parousing your profession recipes. Now, if you are already crafting that checkbox will be locked in so you can toggle on and off at will, even if looking at a different recipe.

* Fixed an issue where the timer button was disappearing behind the profession window when clicking the window. It was really just that the professions window was coming to the front. I adjusted the timer to ensure it shared the same strata and thus would remaing at level with it.

* Fixed an issue where with the slash command sometimes stacks would sometimes fail to stack enough if there were multiple sub-minimum craft size stacks ... tightend up the timings a little bit as well on the stacking.

**NOTE ON THE TIMER AND HOW IT WORKS**

![Timer](https://i.imgur.com/5VGvw9i.jpeg)

Determining the exact estimated countdown is not a perfect thing since there is no way to query the server for the time it takes to craft each time. In addition, lag either from a crowded server, or from your own end can effect the time it takes to craft. So, the key word is this is an estimate only. Here's the logic of how it works:

* The "calculating" delay initially requires 10 crafts to occur. The time between each craft is collected and then the average of those 10 crafts is used to determine time per craft.

* The countdown is refreshed on occasion where a new collection of timestamps is collected and a new average is made. This is done inconspicuously, as to not be obvious, but it will explain to you why say, the countdown timer initially said 7 minutes, but total crafting time end up being 7 minutes and 20 seconds. The timing gets a little tighter the more you craft.


## **Mass Salvage Assist - Version 1.0.6 - Nov 5th, 2024

* The timer window should now only appear automatically when doing a "create all" not just single item crafts

* The timer button has been moved to not be in the way of other addons. It is now located in the top right corner. Added a tooltip as well with additional info.

* You can now type `/msa reset` to reset the position of the timer window to default, in case you accidentally drag it off screen somehow.

* The addon should now properly load no matter what other addons have been installed. There was an issue where craftsim was pre-loading some frames so some of the trogger event listeners I was using were not firing off because they had already been loaded prior to this addon even being loaded.

## **Mass Salvage Assist - Version 1.0.5 - Nov 3rd, 2024

***NEW FEATURE - CRAFTING TIMER***

* This works with ALL profession crafting, not just salvaging recipes.
* In the case of salvaging recipes, an additional option will be included to only calculate the time remaining based on just reagents in bags.
* A button has been added to the professions window to open/close the crafting window, but it will also auto-open on start, and close on finish
* You can also `/msa timer` to show/hide the timer window.

![Crafting Timer](https://i.imgur.com/6vkRNcz.jpeg)

***QUALITY OF LIFE IMPROVEMENTS***

* When using the slash command/macro to craft, if nonstop salvaging is currently disabled, it will now inform you.

* You can now `/msa enable` or `/msa disable` to turn on and off the nonstop salvaging.

* All skinning refine spells have been added to the nonstop crafting.

* Enchanting Recipe *Shatter Essence* is now fully supported

***BUG FIXES***

* Fixed a bug where the addon would cause Lua errors when doing other various tasks in the game if you have not yet opened the professions window. This is because it was on-demand loading certain frames

* Fixed an issue when crafting with macros it sometimes would be point to the wrong bag slot item to salvage and interrupt crafting.


## **Mass Salvage Assist - Version 1.0.4 - Oct 31st, 2024

*I was unaware of the memory leak issue on Blizz's end where when crafting the addon memory usage can go through the roof. While it still does proper garbage collection, it still consumes massive amounts of memory when using professions. This isn't a huge deal, except if you are on a PC where Frames start to slow down, and it gets choppy, this can actually end up interrupting nonstop crafting. So, I was informed by a few people that there is actually this workaround people developed to bypass this memory issue by way of using macros. You can start salvaging with a macro rather than ever opening the player window. I have decided to implement this type of adaptation support to this addon as well.*

* Code tweaked slightly that will help some memory performance with the professions window, but it doesn't resolve the main issue with professions.

* Mass Salvage Assist(MSA) will now full support salvaging nonstop even without the profession window open.

**SALVAGING WITHOUT PROFESSION WINDOW OPEN**

* Slash command has been added to the addon `/msa`

    - Example - Mass Mill Hochenblume:
    - `/msa craft recipe_id item_id`
    - `/msa craft 382981 191461`
    -
    - You can also get help:
    - `/msa help`

    - YES, this can be used within a macro.


## **Mass Salvage Assist - Version 1.0.3 - Oct 29th, 2024

* Coreway Catalysts spell added for Alchemy

* Gleaming Shatter added for Enchanting


## **Mass Salvage Assist - Version 1.0.2 - Oct 29th, 2024

* Changed position of the checkbox so it is compatible with other professions.


## **Mass Salvage Assist - Version 1.0.1 - Oct 29th, 2024

* Fixed an issue that can cause a Lua error with certain reagents.


## **Mass Crafting Assist - Version 1.0.0 - Oct 28th, 2024

* Mass Mill Assist has been converted to Mass Crafting Assist due to expanded functionality beyond milling.