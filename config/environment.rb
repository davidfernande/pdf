# Load the rails application
require File.expand_path('../application', __FILE__)

require './lib/nexus.rb'

# Initialize the rails application
Rails3BootstrapDeviseCancan::Application.initialize!

ENV['RAILS_ENV'] ||= 'development'
ENV['RACK_ENV'] ||= 'development'