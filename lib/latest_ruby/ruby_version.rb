require 'forwardable'

module Latest
  class RubyVersion
    extend Forwardable

    def initialize(version)
      @version = get_version(version)
    end

    def <=>(other)
      @version <=> other.instance_variable_get(:@version)
    end

    def_delegators :@version, :to_s, :prerelease?

    private

    def get_version(ver)
      Gem::Version.new(ver)
    end
  end
end
