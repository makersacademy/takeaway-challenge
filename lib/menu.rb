class Menu
  def initialize
    @menu = {}
  end

  def add dish, price
    @menu[dish] = price
  end

  def show # abstract this to a showable module? takes an item / price hash and lists it
    list = ""
    counter = @menu.size
    @menu.size.times do |dish_no|
      list << "#{@menu.keys[dish_no].capitalize} - £#{@menu[@menu.keys[dish_no]]}" # new line?
      counter -= 1
      list << " // " unless counter == 0
    end
    list
  end

  def price_of dish
    @menu[dish]
  end
end
