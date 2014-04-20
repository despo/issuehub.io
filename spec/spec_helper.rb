APP_ROOT = File.expand_path File.join(File.dirname(__FILE__), '..')
$:.unshift File.expand_path File.join(APP_ROOT, "lib")
require 'bundler/setup'
require 'dotenv'

Dotenv.load(File.expand_path File.join(APP_ROOT, '.env'))

Bundler.require(:test)
require 'kobol'
require 'capybara/rspec'

Capybara.app = Kobol::App

