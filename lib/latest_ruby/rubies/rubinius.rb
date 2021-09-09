module Latest
  class Rubinius
    WEB_SOURCE = 'https://api.github.com/repos/rubinius/rubinius/releases/latest'
    SOURCE = 'https://github.com/rubinius/rubinius/releases/download'
    AVAILABLE_EXTS = ['.tar.bz2']

    attr_reader :source

    def initialize(retriever)
      @retriever = retriever
      @source = WEB_SOURCE
    end

    def version
      @version ||= @retriever.retrieve(self)
    end

    def link(ext = '.tar.bz2')
      if AVAILABLE_EXTS.include?(ext)
        "#{SOURCE}/v#{version}/rubinius-#{version}#{ext}"
      end
    end

  end
end
