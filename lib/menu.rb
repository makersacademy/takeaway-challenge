class Menu
  def initialize
    @menu = {}
  end

  def add dish, price
    @menu[dish] = price
  end

  def show # abstract this to a showable module shared by order and receipt classes? takes an { item: price } hash and lists it on new lines...
    list = ""
    @menu.size.times do |dish_no|
      list << "#{get_name(dish_no)} - £#{get_price(dish_no)}"
      list << " // " unless last_dish? dish_no
    end
    list
  end

  def price_of dish
    @menu[dish]
  end

  private
  def get_name dish_no
    @menu.keys[dish_no].capitalize
  end

  def get_price dish_no
    @menu[@menu.keys[dish_no]]
  end

  def last_dish? dish_no
    dish_no == @menu.size - 1
  end
end
