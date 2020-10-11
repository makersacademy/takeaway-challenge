Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
menu = Menu.new
basket = Basket.new
# The following would not be necessary if implemented in an app rather than irb
curry = menu.dishes[0]
rice = curry = menu.dishes[1]