class Takeaway

  attr_reader :menu

  def initialize
    @menu = { 
      "Cheeseburger" => 10,
      "Veggie burger" => 9,
      "Chicken burger" => 9,
      "Chicken wings" => 7,
      "Hot dog" => 7,
      "Mac & cheese" => 5,
      "Onion rings" => 5,
      "Chips" => 3
      }
  end 

  def list_menu 
    @menu.each {|key, value| puts "#{key} is £#{value}" }
  end 
end 