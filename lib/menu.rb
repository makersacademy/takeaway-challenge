class Menu
   attr_reader :menu

  def initialize
    @menu = { :margherita => 7.50, :pepperoni => 10.50,
              :calzone => 12.50, :diavola => 10.50 }
  end

  def price(item)
    @menu[item.to_sym]
  end
end
