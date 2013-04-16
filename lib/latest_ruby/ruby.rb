require 'forwardable'

module Latest
  class Ruby

    extend Forwardable

    def initialize(ruby)
      @ruby = ruby
    end

    def filename(ext = nil)
      name = (ext ? @ruby.link(ext) : @ruby.link)
      name.split('/').last
    end

    def_delegators :@ruby, :link, :version

  end
end
