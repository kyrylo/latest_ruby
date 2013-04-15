require 'net/http'

module Latest
  class MRIRetriever

    def retrieve(mri)
      page = Net::HTTP.get(URI(mri.source + mri.short_ver + '/'))
      page.scan(/
        (#{ Regexp.escape(mri.short_ver) }\.\d-[a-z0-9]+)\.zip
      /x).uniq.flatten
    end

  end
end
