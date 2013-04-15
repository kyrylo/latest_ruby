require_relative 'latest_ruby/ruby'
require_relative 'latest_ruby/ruby_version'
require_relative 'latest_ruby/mri'

module Latest

  # The VERSION file must be in the root directory of the library.
  VERSION_FILE = File.expand_path('../../VERSION', __FILE__)

  VERSION = File.exist?(VERSION_FILE) ?
    File.read(VERSION_FILE).chomp : '(could not find VERSION file)'

  class << self
    def ruby20
      Ruby.new(MRI.new('2.0', &MRI_RETRIEVER))
    end

    # The latest Ruby version by default.
    alias_method :ruby, :ruby20

    def ruby19
      Ruby.new(MRI.new('1.9', &MRI_RETRIEVER))
    end

    def ruby18
      Ruby.new(MRI.new('1.8', &MRI_RETRIEVER))
    end
  end

end
