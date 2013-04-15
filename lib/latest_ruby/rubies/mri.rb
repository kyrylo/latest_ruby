module Latest

  class MRI
    SOURCE = 'http://ftp.ruby-lang.org/pub/ruby/'
    AVAILABLE_EXTS = ['.tar.gz', '.zip', '.tar.bz2']

    attr_reader :short_ver, :source

    def initialize(short_ver, &retriever)
      @short_ver = short_ver
      @retriever = retriever
      @source = SOURCE
    end

    def version
      @version ||= @retriever.call(self)
    end

    def link(ext = '.tar.gz')
      if AVAILABLE_EXTS.include?(ext)
        source + short_ver + '/' + 'ruby-' + version.to_s + ext
      end
    end
  end

end
