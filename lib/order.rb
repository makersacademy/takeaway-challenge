class Order

  MENU = [
          {name: 'sushi', price: 7},
          {name: 'ramen', price: 12},
          {name: 'soup', price: 4.5},
          {name: 'fish and chips', price: 10},
          {name: 'bread', price: 3},
          {name: 'olives', price: 1.5}
          ]

  attr_reader :basket

  def initialize
    @basket = []
  end

  def show_menu
    menu = ''
    MENU.each {|item| menu << "#{item[:name]}: £#{item[:price]}\n"}
    menu
  end

  def place_order(*dishes, total)
    dishes.each do |dish|
      MENU.each {|item| dish[:price] = item[:price] if dish[:name] == item[:name]}
      @basket << dish
    end
  end

  # @basket << dish.each {|item| item[:price] = MENU[:(item[:name])]}
  #  MENU.select {|dish| price = dish[:price] if dish[:name] == item[:name]}
  # needs to find the way to look for the right price from the MENU!!!


  # def remove_dish(dish)
  #   message = "You did not add #{dish[:name]}!"
  #   raise message if @basket.none? {|item| item[:name] == dish[:name]}
  #   @basket.delete(dish)
  # end

  def total
    price = 0
    @basket.each {|dish| price += dish[:amount]*dish[:price]}
    price
  end
end

# initialize ([{name: 'sushi', amout: 4}, {name: 'soup', amout: 3}], total)
#         => (*dishes, total)
