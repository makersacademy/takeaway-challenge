APP_ROOT = File.dirname(__FILE__)

$:.unshift(File.join(APP_ROOT, 'lib'))
require 'take_away'

take_away_app = TakeAway.new

take_away_app.launch!
