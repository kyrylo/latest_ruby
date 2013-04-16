require 'net/http'
require 'rexml/document'

module Latest
  class RubiniusRetriever

    include REXML

    def retrieve(rbx)
      page = Net::HTTP.get(URI(rbx.source))
      xml  = Document.new(page)
      all_versions = XPath.match(xml, '//Contents//Key').map(&:text)
      candidates = all_versions.find_all { |v| v =~ /\Arubinius-/ }
      stables = candidates.flat_map { |v| v.scan(/-(\d\.\d\.\d)\.tar/) }.flatten
      stables.map { |v| RubyVersion.new(v) }.max
    end

  end
end
