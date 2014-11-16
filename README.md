vagrant-clojure
===============

A clojure development environment consisting of Ubuntu 14.04, Lein 2.0, OpenJDK 1.7, and EMACS 24.4

Vagrant is amazing, first of all. Having said that, in order to stand up a configured Ubuntu 14.04 image w/ Java, Emacs, Clojure, etc.., you need only install vagrant, grab this Git repo, and run `vagrant up` from the directory.  This is pretty much self-contained, with a couple of caveats:

It tries to mount my local Projects directory as a synced folder. So unless you have a c:/Users/icoleman/Projects directory too, you'll probably want to change that.

Also, the initial bootstrap.sh script takes a long time to move on from the successful leiningen setup notification. Not sure why this is, but I don't have time to mess with it now.

To get an emacs window on your local emacs server:

On the windows "host" launch Cygwin X11 from windows start menu, open an xterm window and: 
```bash
xhost +10.0.2.2
```

SSH into the vagrant image
```bash
vagrant ssh -- -X -C
```

On the vagrant image:

```bash
export DISPLAY=10.0.2.2:0.0
emacs &
```
Should launch a new emacs session on the host machine... So long as you have a local X11 installation, that is. Cygwin is working pretty well so far...


To add Scala support (if you're into that sort of thing):
```bash
wget https://dl.bintray.com/sbt/debian/sbt-0.13.6.deb -O /tmp/sbt-0.13.6.deb
sudo dpkg -i !$
```
