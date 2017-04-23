# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# It understands how to display a Menu


class Menu
  attr_reader :menu

  def initialize
    @menu = {"Salad" => 5 ,
      "Pizza" => 8 ,
      "Pasta" => 9 ,
      "Ice Cream" => 5 ,
      "Still Water" => 2.50 ,
      "Pepsi" => 3.00}
  end

  def display
    @menu.each  {|key, value| puts "#{key} - £#{value}"}
  end

end
