class Menu

attr_reader :menu, :order_klass

def initialize
  @menu = {"bread" => 1,"jellyfish" => 5,"sandwich" => 3}
  @order_klass = order_klass
end


end
