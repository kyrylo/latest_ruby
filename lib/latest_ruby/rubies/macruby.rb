module Latest
  class MacRuby

    SOURCE = 'http://macruby.jp/files/'
    AVAILABLE_EXTS = ['.zip']

    attr_reader :source

    def initialize(retriever)
      @retriever = retriever
      @source = SOURCE
    end

    def version
      @version ||= @retriever.retrieve(self)
    end

    def link(ext = '.zip')
      if AVAILABLE_EXTS.include?(ext)
        source + 'MacRuby ' + version.to_s + ext
      end
    end

  end
end
