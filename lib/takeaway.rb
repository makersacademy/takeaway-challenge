class Takeaway

  def initialize
    @menu = [
      { :dish => "margarita", :price => 7.5 },
      { :dish => "hawaian", :price => 8.5 },
      { :dish => "garlic bread", :price => 5 }
    ]
  end

  def view_menu
    @menu
  end

  def select_dish(dish, quantity)
    "#{quantity} x #{dish} added to your basket. That will be £15.
Anything else?"
  end

end
