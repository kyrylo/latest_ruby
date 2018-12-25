require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)
require 'vcr'
VCR.configure do |configuration|
  configuration.cassette_library_dir = 'test/vcr'
  configuration.hook_into :webmock
end
require './lib/latest_ruby'
require 'versionomy'

describe 'Latest::Ruby#filename' do
  subject { Latest.ruby.filename }

  it 'Before 2.6.0 release' do
    VCR.use_cassette '/2.6_only_preview_and_rc' do
      expect(subject).must_equal('ruby-2.6.0-rc2.tar.gz')
    end
  end

  it 'After 2.6.0 release' do
    VCR.use_cassette '/latest' do
      expect(subject).must_equal('ruby-2.6.0.tar.gz')
    end
  end
end

describe 'Latest::RubyVersion#to_s' do # rubocop:disable Metrics/BlockLength
  describe 'preview3' do
    let(:ver) { '2.6.0-preview3' }
    subject { Latest::RubyVersion.new(ver) }

    it 'is incorrect when using Gem.' do
      expect(subject.to_s).must_equal(ver)
    end

    it 'is correct when using Versionomy.' do
      subject.instance_variable_set :@version, Versionomy.parse(ver)
      expect(subject.to_s).must_equal(ver)
    end
  end

  describe 'rc2' do
    let(:ver) { '2.6.0-rc2' }
    subject { Latest::RubyVersion.new(ver) }

    it 'is incorrect when using Gem.' do
      expect(subject.to_s).must_equal(ver)
    end

    it 'is correct when using Versionomy.' do
      subject.instance_variable_set :@version, Versionomy.parse(ver)
      expect(subject.to_s).must_equal(ver)
    end
  end

  describe 'release' do
    let(:ver) { '2.6.0' }
    subject { Latest::RubyVersion.new(ver) }

    it 'is incorrect when using Gem.' do
      expect(subject.to_s).must_equal(ver)
    end

    it 'is correct when using Versionomy.' do
      subject.instance_variable_set :@version, Versionomy.parse(ver)
      expect(subject.to_s).must_equal(ver)
    end
  end
end
