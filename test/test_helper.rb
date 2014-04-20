APP_ROOT = File.expand_path File.join(File.dirname(__FILE__), '..')
$:.unshift File.expand_path File.join(APP_ROOT, "lib")

require 'kobol'
require 'minitest/autorun'
