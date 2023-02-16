# You must create "item_pos" scoreboard in advance, type dummy.

# Save current position of the item. Scaled to keep decimal values.
execute store result score x0 item_pos run data get entity @s Pos[0] 1000
execute store result score y0 item_pos run data get entity @s Pos[1] 1000
execute store result score z0 item_pos run data get entity @s Pos[2] 1000

# Move the item half block forward towards its orientation.
tp @s ^ ^ ^0.5

# Save new position. Scaled to keep decimal values.
execute store result score dx item_pos run data get entity @s Pos[0] 1000
execute store result score dy item_pos run data get entity @s Pos[1] 1000
execute store result score dz item_pos run data get entity @s Pos[2] 1000

# Calculate difference in position, which can be used as a kind of speed vector.
scoreboard players operation dx item_pos -= x0 item_pos
scoreboard players operation dy item_pos -= y0 item_pos
scoreboard players operation dz item_pos -= z0 item_pos

# Asign the previously calculated speed vector to the motion item's tag. Invert previous scale.
execute store result entity @s Motion[0] double 0.001 run scoreboard players get dx item_pos
execute store result entity @s Motion[1] double 0.001 run scoreboard players get dy item_pos
execute store result entity @s Motion[2] double 0.001 run scoreboard players get dz item_pos
