require 'net/http'
require_relative 'latest_ruby/ruby'
require_relative 'latest_ruby/ruby_version'
require_relative 'latest_ruby/rubies/mri'
require_relative 'latest_ruby/rubies/jruby'
require_relative 'latest_ruby/rubies/rubinius'
require_relative 'latest_ruby/rubies/maglev'
require_relative 'latest_ruby/rubies/macruby'
require_relative 'latest_ruby/retrievers/mri_retriever'
require_relative 'latest_ruby/retrievers/jruby_retriever'
require_relative 'latest_ruby/retrievers/rubinius_retriever'
require_relative 'latest_ruby/retrievers/maglev_retriever'
require_relative 'latest_ruby/retrievers/macruby_retriever'

module Latest

  # The VERSION file must be in the root directory of the library.
  VERSION_FILE = File.expand_path('../../VERSION', __FILE__)

  VERSION = File.exist?(VERSION_FILE) ?
    File.read(VERSION_FILE).chomp : '(could not find VERSION file)'

  class << self
    def ruby40
      Ruby.new(MRI.new('4.0', MRIRetriever.new))
    end

    def ruby34
      Ruby.new(MRI.new('3.4', MRIRetriever.new))
    end

    def ruby33
      Ruby.new(MRI.new('3.3', MRIRetriever.new))
    end

    def ruby32
      Ruby.new(MRI.new('3.2', MRIRetriever.new))
    end

    def ruby31
      Ruby.new(MRI.new('3.1', MRIRetriever.new))
    end

    def ruby30
      Ruby.new(MRI.new('3.0', MRIRetriever.new))
    end

    def ruby27
      Ruby.new(MRI.new('2.7', MRIRetriever.new))
    end

    def ruby26
      Ruby.new(MRI.new('2.6', MRIRetriever.new))
    end

    def ruby25
      Ruby.new(MRI.new('2.5', MRIRetriever.new))
    end

    # The latest Ruby version by default.
    alias_method :ruby, :ruby40

    def ruby24
      Ruby.new(MRI.new('2.4', MRIRetriever.new))
    end

    def ruby23
      Ruby.new(MRI.new('2.3', MRIRetriever.new))
    end

    def ruby22
      Ruby.new(MRI.new('2.2', MRIRetriever.new))
    end

    def ruby21
      Ruby.new(MRI.new('2.1', MRIRetriever.new))
    end

    def ruby20
      Ruby.new(MRI.new('2.0', MRIRetriever.new))
    end

    def ruby19
      Ruby.new(MRI.new('1.9', MRIRetriever.new))
    end

    def ruby18
      Ruby.new(MRI.new('1.8', MRIRetriever.new))
    end

    def jruby
      Ruby.new(JRuby.new(JRubyRetriever.new))
    end

    def rubinius
      Ruby.new(Rubinius.new(RubiniusRetriever.new))
    end
    alias_method :rbx, :rubinius

    def maglev
      Ruby.new(MagLev.new(MagLevRetriever.new))
    end

    def macruby
      Ruby.new(MacRuby.new(MacRubyRetriever.new))
    end
  end

end
