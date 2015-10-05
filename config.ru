APP_ROOT = File.dirname(__FILE__)
require 'dotenv'
Dotenv.load

require './lib/kobol'

run Kobol::App
