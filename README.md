Latest Ruby
===========

* Repository: [https://github.com/kyrylo/latest_ruby][repo]

Description
-----------

The purpose of this library is to answer a simple but capacious question: “What
is the latest version of Ruby now?”. It can also be asked for the latest
versions of Rubinius, JRuby, MagLev, MacRuby, Cardinal, IronRuby and Topaz.

Installation
------------

    gem install latest_ruby

Synopsis
--------

I find this library useful for the [`pry-doc` Pry plugin][prydoc]. Namely, for
automation of generation the latest documentation for Rubies.

### Usage

Let's find out the latest versions of Rubies.

```ruby
# MRI 2.0
Latest.ruby #=> #<Ruby:...>
# The same.
Latest.ruby20

# MRI 1.9
Latest.ruby19 #=> #<Ruby:...>

# MRI 1.8
Latest.ruby18 #=> #<Ruby:...>

# JRuby.
Latest.jruby #=> #<Ruby:...>

# Rubinius.
Latest.rubinius #=> #<Ruby:...>
# The same.
Latest.rbx

# MagLev
Latest.maglev #=> #<Ruby:...>

# Cardinal
Latest.cardinal #=> #<Ruby:...>

# MacRuby
Latest.macruby #=> #<Ruby:...>

# IronRuby
Latest.ironruby #=> #<Ruby:...>

# Topaz
Latest.topaz #=> #<Ruby:...>
```

So, what's that “Ruby” object that it returns? It's merely an object with a
bunch of information about a Ruby.

```ruby
Latest.ruby.version #=> "2.0.0"
Latest.ruby.patchlevel #=> "p0"
Latest.ruby.full_version #=> "2.0.0-p0"
```

Latest Ruby also provides one useful (well, it's useful for me, at least) way to
retrieve a download link for a Ruby.

```ruby
Latest.ruby.link #=> "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz"
# The same.
Latest.ruby.link(:gz) #=> "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz"

Latest.ruby.link(:bz2) #=> "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2"
Latest.ruby.link(:zip) #=> "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip"
```

Limitations
-----------

### OS support

Latest Ruby is a cross-platform library.

### Rubies

* Ruby 1.9.3 and higher

Please, ping me, if you need support for other Ruby implementations. Or, if you
prefer, send a pull request.

Credits
-------

Licence
-------

The project uses Zlib licence. See LICENCE file for more information.

[repo]: https://github.com/kyrylo/latest_ruby
[prydoc]: https://github.com/pry/pry-doc
