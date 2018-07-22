class Menu

  def initialize
    @menu = {
        "chicken burger" => 5.50 ,
        "cheese burger" => 5.00 ,
        "vegetable fried rice" => 4.50 ,
     }
  end

  attr_reader :menu

  def print_menu
    @menu.each do |key, value|
      puts "#{key}: #{sprintf('%.2f', value)}"
    end
  end

end
