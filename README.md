ahn-stomp
===========

This plugin provides a Stomp message gateway client, useful to
communicate with your Adhearsion app from other processes.

Features
--------

What is Stomp?
==============

Stomp is a very simple message-queue protocol with which two separate systems can communicate. Because the protocol is so simple, there are many Stomp server implementations from which you can choose. Some of these include

 - ActiveMQ (http://activemq.com)
 - Ruby "stompserver" gem (gem install stompserver)
 - RabbitMQ (http://rabbitmq.com)

If you wish to get up and running with a development environment, the Ruby stompserver gem is a fantastic starting point. For a critical production system, ActiveMQ should probably be used but it bears the cumbersome paradigm of many "enterprisey" Java applications.

How does it work?
=================

Stomp is used when certain processes have defined responsibilities. For example, your Adhearsion application's responsibility is to communicate with your Asterisk machine. Other processes (e.g. a Rails web application) will probably need to instruct Adhearsion to do something. Instructions may include

 - Start a new call between two given phone numbers
 - Have a particular call do something based on a new event
 - Hangup a call

Below is a diagram which should give you a better idea of how it works.

    Process  Process  Process (e.g. Rails)
         \      |      /
          \     |     /
           Stomp Server       (e.g. ActiveMQ)
                |
                |
             Process          (e.g. Adhearsion)

Note: Adhearsion could also be the sender of messages through the Stomp server which are consumed by a number of handlers.

Setting up a Ruby Stomp server
==============================

Install the pure-Ruby Stomp server by doing "gem install stompserver". This will add the "stompserver" command to your system. When running it without any parameters, it starts without requiring authentication. If you're wanting to get a quick experiment running, I recommend simply doing that.

Open the `stomp_gateway.yml` file in the stomp_gateway component folder. Comment out the four settings at the top of the file named "user", "pass", "host" and "port" by prepending a "#" to their line. This will cause the component to choose defaults for those properties. The component's defaults will match the expected credentials for the experimental stompserver you're already running on your computer.

You also need specify a subscription name in

    events.stomp.start_call.each do |event|
      # The "event" variable holds a Stomp::Message object.
      name = event.headers
    end

Requirements
------------

* A working Stomp server

Install
-------

    gem install ahn-stomp

Examples
--------

```ruby
  require 'ahn-stomp'
  FIXME (code sample of usage)
```

Author
------

Original author: Jay Phillips

Contributors:

* Luca Pradovera

Links
-----
* [Source](https://github.com/ahn-stomp/ahn-stomp)
* [Documentation](http://rdoc.info/github/ahn-stomp/ahn-stomp/master/frames)
* [Bug Tracker](https://github.com/ahn-stomp/ahn-stomp/issues)

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  * If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2011 MojoLingo LLC. MIT license.
