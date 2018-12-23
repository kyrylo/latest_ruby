Gem::Specification.new do |s|
  s.name         = 'latest_ruby'
  s.version      = File.read('VERSION')
  s.date         = Time.now.strftime('%Y-%m-%d')
  s.summary      = 'Answers the question of what the latest Ruby version is'
  s.description  = 'Knows about MRI, Rubinius, JRuby, MagLev and MacRuby.'
  s.author       = 'Kyrylo Silin'
  s.email        = 'kyrylosilin@gmail.com'
  s.homepage     = 'https://github.com/kyrylo/latest_ruby'
  s.licenses     = 'zlib'

  s.require_path = 'lib'
  s.files        = `git ls-files`.split("\n")

  s.add_development_dependency 'rake'
  s.add_development_dependency 'pry'
end
