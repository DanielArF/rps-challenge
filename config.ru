require 'rubygems'
use Rack::Static, :urls => ['/css', '/js', '/img'], root: 'assets'
require File.join(File.dirname(__FILE__), 'lib/rps_app.rb')

run RPSApp