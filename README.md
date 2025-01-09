# Mass Salvage Assist - World of Warcraft Addon

**JOIN-UP ON DISCORD**

[Join Discord Here](https://discord.gg/guBtvUU2ks)

**WHAT IT DOES**

Assists in Mass Salvaging/crafting in World of Warcraft by allowing you to mass salvage nonstop. For example, Mass milling, prospecting, thaumaturgy, etc.

**COMPATIBLE PROFESSIONS**

* Alchemy
* Herbalism
* Cooking
* Tailoring
* Engineering
* Jewelcrafting
* Inscription
* Enchanting
* Skinning

* Compatible with mass salvaging of the current expansion, as well as all previous expansions, if it applies.
* Continually combines all stacks of the originally selected reagents until complete
* Helps avoid the stacking error that prevents you from mass milling even though you should be able to.

**Slash command** - `/msa`

*Craft without the profession window by using macros!*

    - Example - Mass Mill Hochenblume:
    - /msa craft recipe_id item_id
    - /msa craft 382981 191461
    -
    - You can also get help:
    - /msa help
    - /msa enable   - Turn on endless salvaging
    - /msa disable  - Turn off endless salvaging
    - /msa resume   - Continue with most recently used spell
    - /msa timer    - Show or Hide the Crafting Timer
    - /msa reset    - Resets timer position to default

![Example](https://i.imgur.com/8r91gAQ.gif)

**CRAFTING TIMER**

* This works with ALL profession crafting, not just salvaging recipes.
* In the case of salvaging recipes, an additional option will be included to only calculate the time remaining based on just reagents in bags.

![Crafting Timer](https://i.imgur.com/6vkRNcz.jpeg)

**AFK ALERT**

* Feature can be enabled and disabled.
* Bell sound when player goes AFK (but only when mass salvaging)
* Raid Alert sound when the 20 second countdown to being kicked offline appears (but only if crafting)

**LIMITATIONS**

* Only reagents that are within your player bags, and the player reagent bag will be continually stacked -- not your bank, reagent bank, or warband bags.
* Blizzard has some weird logic that will cause the crafting to fail to if you do it while your player bank is open and the addon tries to stack. CLOSE THE BANK.
* The reagent type must first be manually selected. CHOOSE THE FIRST OPTION OF THAT TYPE/QUALITY ALWAYS
* If you click the create all button and it instantly fails due to a stacking issue, this addon will build the stack properly, so when you click it again, it will work the 2nd time. The issue is that the addon cannot auto-trigger crafting to start as this is a protected action restricted from addons. So, it will rebuild the stack, but you will need to click the button again. Double to check you are selecting the first stack in the reagent choices.
* If your initial stack is too small, like say, it's only 5 items and you can only salvage once, then there is not enough time to stack items and continue salvaging, so it will not craft nonstop. There is a built-in delay due to item stacking limits by Blizzard's UI for stacking to complete. As such, you will need to re-trigger crafting in these cases as the addon cannot do it automatically.

![First Slot Always](https://i.imgur.com/k9KodKZ.png)

**JOIN-UP ON DISCORD**

[Join Discord Here](https://discord.gg/guBtvUU2ks)