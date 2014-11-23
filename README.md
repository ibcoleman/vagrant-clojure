vagrant-clojure
===============

A clojure development environment consisting of Ubuntu 14.04, Lein 2.0, OpenJDK 1.7, and EMACS 24.4

Vagrant is amazing, first of all. Having said that, in order to stand up a configured Ubuntu 14.04 image w/ Java, Emacs, Clojure, etc.., you need only install vagrant, grab these config files Git repo, and run `vagrant up` from the directory.  This is pretty much self-contained, with a couple of caveats:

Shared directories are defined in the Vagrant. It tries to mount my local Projects directory as a synced folder. So unless you have a c:/Users/icoleman/Projects directory too, you'll probably want to change that.
To get an emacs window on your local emacs server:

SSH into the vagrant image
```bash
vagrant ssh -- -X -C
```

On the vagrant image:

```bash
emacs &
```
Should launch a new emacs session on the host machine... So long as you have a local X11 installation, that is. Cygwin is working pretty well so far...

Super-short version:

```bash
c:> vagrant ssh -- -X -C
bash$ emacs &
```

All Done.

To add Scala support (if you're into that sort of thing):
```bash
wget https://dl.bintray.com/sbt/debian/sbt-0.13.6.deb -O /tmp/sbt-0.13.6.deb
sudo dpkg -i !$
```

Update: I added docker support, since it's fairly small and useful for dev. One odd issue with the bootstrap.sh file: It adds the required docker entry to apt-get's repo list, but apt-get fails to detect the update. So in order to get docker you need to:

```bash
> vagrant up
> vagrant reload --provision
```

Not sure exactly what's going on.

