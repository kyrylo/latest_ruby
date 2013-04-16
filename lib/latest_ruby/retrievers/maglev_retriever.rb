module Latest
  class MagLevRetriever

    def retrieve(maglev)
      page = Net::HTTP.get(URI(maglev.source))
      page.scan(/MagLev-(\d\.\d\.\d)\.tar\.gz/).
        uniq.flatten.map { |v| RubyVersion.new(v) }.max
    end

  end
end
