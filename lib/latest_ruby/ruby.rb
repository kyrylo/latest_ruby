require 'forwardable'

module Latest
  class Ruby

    extend Forwardable

    def initialize(ruby)
      @ruby = ruby
    end

    def version
      @version ||= @ruby.versions.map { |v| RubyVersion.new(v) }.max
    end

    def_delegators :@ruby, :link

  end
end
