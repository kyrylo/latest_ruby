require 'net/http'

module Latest

  MRI_RETRIEVER = proc do |mri|
    page = Net::HTTP.get(URI(mri.source + mri.short_ver + '/'))
    rubies = page.scan(/
      (#{ Regexp.escape(mri.short_ver) }\.\d-[a-z0-9]+)\.zip
    /x).uniq.flatten
    rubies.map { |ver| RubyVersion.new(ver) }.max
  end

  class MRI
    SOURCE = 'http://ftp.ruby-lang.org/pub/ruby/'

    attr_reader :short_ver, :source

    def initialize(short_ver, &retriever)
      @short_ver = short_ver
      @retriever = retriever
      @source = SOURCE
    end

    def version
      @retriever.call(self)
    end
  end

end
