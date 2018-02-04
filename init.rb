APP_ROOT = File.dirname(__FILE__)

$:.unshift(File.join(APP_ROOT))
require 'take_away_app'

take_away_app = TakeAwayApp.new

take_away_app.launch!
