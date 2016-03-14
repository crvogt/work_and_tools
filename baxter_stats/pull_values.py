#!/usr/bin/env python

import string


limb_pose = open("/home/carson/work_and_tools/baxter_stats/cropped_files/cbaxter_at_180_cm_1_speed", "r")

values = list()

count = 0
i = 0
temp2 = 0
while i < 7:
	temp = limb_pose.readline()
	if(count != 3):
		values.append(temp)
		count += 1
	else:
		count = 0
	i += 1

limb_pose.close()

new_values = list() 
new_str = ""
i = 0
j = 0
while i < len(values):
	while j < 8:
		new_str += values[i][j]
		j += 1
	new_values.append(new_str)
	new_str = ""
	j = 0
	i += 1
	
i = 0
while i < len(new_values):
	print(new_values[i])
	i+=1

print(temp2 * 2)