
class Menu

  OPTIONS = {
      "apple_juice"       =>    3.0,
      "orange_juice"      =>    3.0,
      "cranberry_juice"   =>    3.0,
      "daily_cocktail"    =>    4.5,
      "soup_of_the_day"   =>    5.0,
      "garlic_bread"      =>    6.0,
      "chicken_wing"      =>    6.5,
      "pizza_slice"       =>    7.0,
      "chef_special"      =>    10.0
  }

  attr_reader :OPTIONS, :PRICES

  def initialize
    @options = OPTIONS
  end


  def view
    OPTIONS.each { |x, y| puts x.to_s + " " + y.to_s}
  end

  def options
    OPTIONS
  end


  def query_price(*options)
    # total = 0
    # prices = []
    # options.each { |x| prices << OPTIONS[x]}
    # prices.each { |x| total = total + x}
    # puts "Total: £#{total}"
    options.each { |x| puts OPTIONS[x]}

  end
end

menu = Menu.new
puts menu.query_price("chef special")