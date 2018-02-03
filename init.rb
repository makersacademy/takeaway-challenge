APP_ROOT = File.dirname(__FILE__)

$:.unshift( File.join(APP_ROOT, 'lib') )
require 'menu'

spices_of_india = Restaurant.new

spices_of_india.launch!
