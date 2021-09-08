require 'json'

module Latest
  class RubiniusRetriever
    def retrieve(rbx)
      page = Net::HTTP.get(URI(rbx.source))
      latest_version = JSON.parse(page)
      RubyVersion.new(latest_version['tag_name'].scan(/\d.\d/).first)
    end
  end
end
