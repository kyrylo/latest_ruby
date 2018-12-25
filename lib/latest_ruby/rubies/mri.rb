module Latest
  class MRI
    SOURCE = 'http://ftp.ruby-lang.org/pub/ruby/'.freeze
    AVAILABLE_EXTS = ['.tar.gz', '.zip', '.tar.bz2'].freeze

    attr_reader :short_ver, :source

    def initialize(short_ver, retriever)
      @short_ver = short_ver
      @retriever = retriever
      @source = SOURCE
    end

    def version
      @version ||= @retriever.retrieve(self)
    end

    def link(ext = '.tar.gz')
      return unless AVAILABLE_EXTS.include?(ext)

      ver = version.prerelease? ? version.to_s.gsub('.pre.', '-') : version.to_s
      "#{source}#{short_ver}/ruby-#{ver}#{ext}"
    end
  end
end
