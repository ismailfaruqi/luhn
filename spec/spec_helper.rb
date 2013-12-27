require 'rspec/autorun'
require 'pry'

base_dir = File.expand_path(File.join(File.dirname(__FILE__), '..'))

Dir[File.join(base_dir, "lib/**/*.rb")].each { |f| require f }
Dir[File.join(base_dir, "spec/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.order = "random"
end
