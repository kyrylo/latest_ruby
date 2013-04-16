module Latest
  class Rubinius

    SOURCE = 'http://asset.rubini.us/'
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
        source + 'rubinius-' + version.to_s + ext
      end
    end

  end
end
