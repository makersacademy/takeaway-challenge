class Menu
  # attr_reader
  def initialize
    @menu = {
      Burger:8,
      Fries:4,
      Milkshake:4,
      Doughnut:2,
      Cake:4,
      Chickenbreast:9,
      Olive:2,
      Cheese:1,
      Salad:6
    }
    @order_list = {}
    @order_total = 0
  end

  def show
    @menu.map{|key,value|
      "#{key.to_s}, £#{value}\n"
    }.join(" ")
  end

  def item_available?(item)
    menu.any? { |menu| menu[:item] == item }
  end


  def add_dish(name,quantity)
    #can make a new array to hold hashes of individual dish order
    #or simply adding the key-value pair to exisiting hash
    @order_list[name]= quantity
  end

  def total_price
    total = 0
    @order_list.each{|name,quantity|
      total += (quantity * @menu[name])
      #quantity.times{total += @menu[name]}
    }
    return total
  end

end
