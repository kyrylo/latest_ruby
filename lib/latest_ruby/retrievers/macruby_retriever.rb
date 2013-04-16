module Latest
  class MacRubyRetriever

    def retrieve(macruby)
      page = Net::HTTP.get(URI(macruby.source))
      page.scan(/MacRuby (.+)\.zip/).
        uniq.flatten.map { |v| RubyVersion.new(v) }.max
    end

  end
end
