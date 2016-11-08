UPDATE mob_spawn_points SET pos_x=-206, pos_y=0, pos_z=471, pos_rot=274  WHERE mobid=17138051;
UPDATE mob_spawn_points SET pos_x=-205, pos_y=0, pos_z=472, pos_rot=274  WHERE mobid=17138052;
UPDATE mob_spawn_points SET pos_x=-205.25, pos_y=0, pos_z=472, pos_rot=274  WHERE mobid=17138053;
UPDATE mob_spawn_points SET pos_x=-205.50, pos_y=0, pos_z=472, pos_rot=274  WHERE mobid=17138054;
UPDATE mob_spawn_points SET pos_x=-206, pos_y=0, pos_z=469, pos_rot=244  WHERE mobid=17138055;
UPDATE mob_spawn_points SET pos_x=-206.25, pos_y=0, pos_z=469, pos_rot=244  WHERE mobid=17138056;
UPDATE mob_spawn_points SET pos_x=-206.50, pos_y=0, pos_z=469, pos_rot=244  WHERE mobid=17138057;

-- Feeorin pool ID : 1319
-- Fay pool ID     : 1307
--

UPDATE mob_groups SET spawntype=128, dropid=0, HP=30000, MP=2000, minLevel=75, maxLevel=75 WHERE groupid=3916;

UPDATE mob_groups SET spawntype=128, dropid=0, HP=15000, MP=1000, minLevel=73, maxLevel=75 WHERE groupid=3915;


--mobType , skill_list_id 195

UPDATE mob_pools SET mobType=3 WHERE poolid=1307;

UPDATE mob_pools SET mobType=3 WHERE poolid=1319;
