class Takeaway

  DEFAULT_MENU = {Fish: 3, Jelly: 1, Liver: 2, Egg: 1}
  attr_reader :meal

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

  def running_total
    @meal.each do |dish|
      @bill += @menu[dish.to_sym]
      return "Your bill so far comes to £#{@bill}. Thank you!"
    end
  end

  def checkout
    order_placed = Time.now
    delivery_due = Time.now+3600
    "Your order was placed at #{order_placed}. Your food should be with you by #{delivery_due}."
  end

end