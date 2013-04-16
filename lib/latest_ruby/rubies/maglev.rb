module Latest
  class MagLev

    SOURCE = 'http://glass-downloads.gemstone.com/maglev/'
    AVAILABLE_EXTS = ['.tar.gz']

    attr_reader :source

    def initialize(retriever)
      @retriever = retriever
      @source = SOURCE
    end

    def version
      @version ||= @retriever.retrieve(self)
    end

    def link(ext = '.tar.gz')
      if AVAILABLE_EXTS.include?(ext)
        source + 'MagLev-' + version.to_s + ext
      end
    end

  end
end
