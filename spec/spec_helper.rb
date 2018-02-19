$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kele'
require 'dotenv'
require 'httparty'
require 'vcr'

Dotenv.load

VCR.configure do |config|
    config.cassette_library_dir = 'spec/vcr'
    config.hook_into  :webmock
end
