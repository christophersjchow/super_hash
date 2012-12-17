Gem::Specification.new do |s|
  s.name        = 'super_hash'
  s.version     = '1.0.3'
  s.date        = '2012-12-13'
  s.summary     = 'Struct like behaviour for Hashes.'
  s.description = "Allow struct like behaviour for Hashes. Supports arbitrary nesting and doesn't break the existing Hash interface."
  s.authors     = ['Christopher Chow', 'Carl Woodward']
  s.email       = 'chris@chowie.net'
  s.files       = Dir.glob('lib/**/*.rb')
  s.homepage    = 'https://github.com/Soliah/super_hash'

  s.add_runtime_dependency 'i18n'
  s.add_runtime_dependency 'activesupport', [">= 3.2.0"]

  s.add_development_dependency 'rspec', [">= 2.12.0"]
  s.add_development_dependency 'json_spec', [">= 1.1.0"]
end
