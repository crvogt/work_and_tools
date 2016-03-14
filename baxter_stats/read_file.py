#!/usr/bin/env python

limb_pose = open("/home/carson/work_and_tools/baxter_stats/baxter_at_180_cm_point_4_speed", "r")

values = list()

i = 0
while i < 2000:
	if limb_pose.readline() == "  position: \n":
		values.append(limb_pose.readline())
		values.append(limb_pose.readline())
		values.append(limb_pose.readline())
	i += 1
limb_pose.close()

count = 1
i = 0
limb_pose_cut = open("/home/carson/work_and_tools/baxter_stats/cropped_files/cbaxter_at_180_cm_4_speed", "w")

while i < len(values):
	limb_pose_cut.write(values[i])
	if(count == 3):
		limb_pose_cut.write("\n")
		count = 0
	count += 1
	i += 1
limb_pose_cut.close()
print("File had %d values", len(values)/3)
print("Closing File")
