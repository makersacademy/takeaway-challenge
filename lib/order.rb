class Order
  attr_reader :menu

 def initialize
    @menu = Menu.new.menu
 end

end
