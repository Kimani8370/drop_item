# Summon dummy item. Doesn't care what item is it, since it will be replaced, but MUST be something.
summon item ~ ~ ~ {Item:{id:"stone",Count:1},Tags:["drop_inv"],PickupDelay:40s}
# Copy to this dummy item the data from the player's slot 9 (first column of top row).
# If you need to check for more than a single slot, dupe this function and change the slot number.
data modify entity @e[type=item,tag=drop_inv,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:9b}]

# tp the item to the player to align its orientation with the player's.
tp @e[type=item,limit=1,sort=nearest] @s
# tp the item so it gets spitted out from a "natural-ish" heigh.
tp @e[type=item,limit=1,sort=nearest] ~ ~1.4 ~
# Run the "power" function uploaded to this same repository.
execute positioned ~ ~1.4 ~ as @e[type=item,limit=1,sort=nearest] at @s run function namespace:power

# Clear player's slot.
item replace entity @s inventory.0 with air