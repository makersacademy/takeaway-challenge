class MenuList
  #Stores menu info

  attr_reader :menu
  def initialize
    @menu = [
      { order_num: 1, name: "Pot Noodle", price: 1.00 },
      { order_num: 2, name: "Cheese Toastie", price: 2.00 },
      { order_num: 3, name: "Plain Toast", price: 1.00 },
      { order_num: 4, name: "Cold Potatoes", price: 1.00 }
    ]
  end

  def get_menu
    menu
  end
end
