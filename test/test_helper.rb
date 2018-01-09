ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require 'factory_girl_rails'
FactoryGirl.find_definitions
require 'support/factory_girl'
require 'rspec/rails'


RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
