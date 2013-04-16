module Latest
  class JRuby

    SOURCE = 'http://jruby.org.s3.amazonaws.com/downloads/'
    WEB_SOURCE = 'http://jruby.org/download'
    AVAILABLE_EXTS = ['.tar.gz', '.zip']

    attr_reader :source, :web_source

    def initialize(retriever)
      @retriever = retriever
      @source = WEB_SOURCE
    end

    def version
      @version ||= @retriever.retrieve(self)
    end

    def link(ext = '.tar.gz')
      if AVAILABLE_EXTS.include?(ext)
        SOURCE + '/' + version.to_s + '/jruby-bin-' + version.to_s + ext
      end
    end

  end
end
