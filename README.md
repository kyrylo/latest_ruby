Latest Ruby
===========

* Repository: [https://github.com/kyrylo/latest_ruby][repo]

Description
-----------

The purpose of this library is to answer a simple but capacious question: “What
is the latest version of Ruby now?”. It can also be asked for the latest
versions of Rubinius, JRuby, MagLev, MacRuby.

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
Latest.ruby.version.to_s #=> "2.0.0-p0"
# The same.
Latest.ruby20.version.to_s

# MRI 1.9
Latest.ruby19.version.to_s #=> "1.9.3-p392"

# MRI 1.8
Latest.ruby18.version.to_s #=> "1.8.7-p371"

# JRuby.
Latest.jruby.version.to_s #=> "1.7.3"

# Rubinius.
Latest.rubinius.version.to_s #=> "1.2.4"
# The same.
Latest.rbx.version.to_s

# MagLev
Latest.maglev.version.to_s #=> "1.0.0"

# MacRuby
Latest.macruby.version.to_s #=> "0.12"
```

Latest Ruby also provides one useful (well, it's useful for me, at least) way to
retrieve a download link for a Ruby.

```ruby
Latest.ruby.link #=> "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz"
# The same.
Latest.ruby.link('.tar.gz') #=> "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz"

Latest.ruby.link('.tar.bz2') #=> "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2"
Latest.ruby.link('.zip') #=> "http://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip"
```

Limitations
-----------

### OS support

Latest Ruby is a cross-platform library.

### Rubies

* Ruby 1.9.3 and higher

Please, ping me, if you need support for other Ruby implementations. Or, if you
prefer, send a pull request. Currently, the library is unbelievably simple.
Ideas and suggestions are welcome (just file issues).

Licence
-------

The project uses Zlib licence. See LICENCE file for more information.

[repo]: https://github.com/kyrylo/latest_ruby
[prydoc]: https://github.com/pry/pry-doc
