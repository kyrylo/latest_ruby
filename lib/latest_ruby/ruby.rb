require 'forwardable'

module Latest
  class Ruby

    extend Forwardable

    def initialize(ruby)
      @ruby = ruby
    end

    def_delegators :@ruby, :version, :link

  end
end
