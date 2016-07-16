class Takeaway

  attr_reader :menu

  def initialize
    @menu = {"Chicken Gyoza" => 4.20,
             "Katsu Curry & Rice" => 8.50,
             "Nettle Soup" => 2.00,
             "Sushi Roll" => 5.60,
             "Edamame" => 3.00,}
  end

  def select_dish(item,quanity=1)
    quanity == 1 ? s = '' : s = 's'
    quanity == 1 ? ve = 's' : ve = 've'
    "#{quanity} order#{s} of '#{item}' ha#{ve} been added to your basket."
  end

end
