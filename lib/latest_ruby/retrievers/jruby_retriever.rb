module Latest
  class JRubyRetriever

    def retrieve(jruby)
      page = Net::HTTP.get(URI(jruby.source))
      ver  = page.scan(/Current Release: JRuby (.+)<\/h2>/).flatten.first
      RubyVersion.new(ver)
    end

  end
end
