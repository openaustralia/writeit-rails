Gem::Specification.new do |s|
  s.name        = 'writeit-rails'
  s.version     = '0.0.2'
  s.date        = '2013-12-22'
  s.summary     = "This Gem provides a basic api client for Write-it"
  s.description = "A simple hello world gem"
  s.authors     = ["Ciudadano Inteligente"]
  s.email       = 'lab@ciudadanointeligente.org'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://rubygems.org/gems/writeit-rails'
  s.license       = 'Apache License, Version 2.0'
  s.add_runtime_dependency 'rest-client'
end
