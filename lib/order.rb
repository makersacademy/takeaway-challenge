class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add(item)
    item = item.to_sym
    @menu.all_dishes.each do |dish|
      dish.each do |name, price|
        if name == item
          @basket << dish
        else
          "Sorry, #{item.downcase} is not on the menu"
        end
      end
    end
  end

  def remove
  end

  def order_summary
  end

  def checkout
  end


end
