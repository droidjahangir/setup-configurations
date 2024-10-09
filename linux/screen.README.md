## Screen

Enter a screen `screen` or `screen -S monitor` --> monitor for screen name

* `screen -S <name>` create a screen
* `screen -r <screen_name/id>` ---> reattach a screen
* `CTRL a+d` ---> detach from a screen
* `screen -d -r session_name` --> detach and reattach to a directory, This command will help if there have any issue to attach.
* `screen -r session_name/id` ---> reattach to a screen
* `screen -X -S screen_name quit` ---> completely quite from a specific screen
* `screen -S 34875.pts-0.jahangir -X quit` ---> kill a screen
* `killall screen` ---> kill all screen
