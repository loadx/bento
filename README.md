# Bento 

Bento is a project that encapsulates
[Veewee](https://github.com/jedi4ever/veewee/) definitions for
building [Vagrant](http://vagrantup.com) baseboxes. Originally created by opscode for use with [cookbooks](http://community.opscode.com/users/Opscode).

These basebox definitions are originally based on
[work done by Tim Dysinger](https://github.com/dysinger/basebox) to
make "Don't Repeat Yourself" (DRY) modular baseboxes. Thanks Tim!

## Current Baseboxes

* debian-6.0.0 (i386)
* debian-7.0.0 (i386)
* debian-7.0.0 (x64)
* debian-7.1.0 (i386)
* ubuntu-12.04 (x64)
* ubuntu-12.10 (i386)
* ubuntu-13.04 (x64)

## Getting Started

First, clone the project, then install the required Gems with Bundler.
```bash
    $ git clone git://github.com/opscode/bento.git
    $ cd bento
    $ bundle install --path=.gems
```

Next install Polipo using your favorite package manager or from source
```bash
   $ brew -v install polipo
```

Customise polipo's config to your choosing. 

**_You should leave the port as the default 8123_**
<br /><em>If you want to change this you will need to update the preseed values accordingly</em>


Now start polipo
```bash
    $ polipo -c /path/to/your/config
```

Back in Bento
List available baseboxes that can be built:
```bash
    $ bundle exec veewee <provider> list
```

Build, for example, the debian-7.0.0 basebox.
```bash
    $ bundle exec veewee <provider> build debian-7.0.0
```

Aside from that, the basebox should be ready to use. Export it:
```bash
    $ bundle exec veewee <provider> export debian-7.0.0
```

Congratulations! You now have `./debian7.0.0.box`, a fully functional
basebox that you can then add to Vagrant and start testing cookbooks.

## How It Works

Veewee reads the definition specified and automatically builds a
VirtualBox machine. The VirtualBox guest additions and the target OS
ISO are downloaded into the `iso/` directory.

## Definitions

The definitions themselves are split up into directories that get
symlinked into specific basebox directories.

Most of the files are symlinked for a particular box. The one
exception is the `definition.rb` file, which contains the specific
configuration for the Veewee session for a basebox, including the ISO
filename, its source URL, and the MD5 checksum of the file.

See each file for more information.
Common files appear in the `.common` directory while version specific information lives in a shared folder of similar name.
Everything else should be considered specific to the environment's combination.


License and Authors
===================

- Author:: Andy Zhang (aibieliandy@gmail.com)
- Author:: Mat Brennan (loadx.mat@gmail.com)
- Author:: Seth Chisamore (<schisamo@opscode.com>)
- Author:: Stephen Delano (<stephen@opscode.com>)
- Author:: Joshua Timberman (<joshua@opscode.com>)
- Author:: Tim Dysinger (<tim@dysinger.net>)
- Author:: Chris McClimans (<chris@hippiehacker.org>)

Copyright:: 2012, Opscode, Inc (<legal@opscode.com>)
Copyright:: 2011-2012, Tim Dysinger (<tim@dysinger.net>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
