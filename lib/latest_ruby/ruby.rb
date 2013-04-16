require 'forwardable'

module Latest
  class Ruby

    extend Forwardable

    def initialize(ruby)
      @ruby = ruby
    end

    def_delegators :@ruby, :link, :version

  end
end
