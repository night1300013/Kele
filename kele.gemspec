lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kele/version'

Gem::Specification.new do |s|
  s.name          = 'kele'
  s.version       = '0.0.1'
  s.date          = '2018-02-11'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['ShangMing Cherng']
  s.email         = 'night1300013@gmail.com'
  s.files         = ['lib/kele.rb']
  s.require_paths = ["lib"]
  s.homepage      =
    'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httpparty', '~> 0.13'
  s.add_runtime_dependency 'json', '~> 1.8'
  s.add_development_dependency 'vcr', '~> 0'
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency 'webmock', '~> 0'
  s.add_development_dependency 'dotenv', '~> 0'
end
