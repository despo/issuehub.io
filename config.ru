APP_ROOT = File.dirname(__FILE__)
require './lib/kobol'

require 'dotenv'
Dotenv.load

run Kobol::App
