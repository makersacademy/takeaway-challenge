class Takeaway
  
  DEFAULT_MENU = {Fish: 3, Jelly: 1, Liver: 2, Egg: 1}
  attr_reader :menu, :meal, :bill

  def initialize(menu = DEFAULT_MENU)
    @menu = DEFAULT_MENU
    @meal = []
    @bill = 0
  end

  def choose(dish)
    @meal << dish
  end

  def display_menu
    @menu.map do |dish, price|
      "#{dish} - £#{price}"
    end.join("\n")
  end

  def total
    @meal.each do |dish|
      @bill += @menu[dish.to_sym]
      return "Your bill comes to £#{@bill}. Thank you!"
    end
  end

end