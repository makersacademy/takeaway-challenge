class TakeawayMenu
  attr_reader :dish_wanted

  def initialize
    @dish_wanted = 0
  end

  def menu
    {
      "Lasagne" => 12.00,
      "Sausage and Mash" => 11.50,
      "Lamb Saag" => 9.00,
      "Beef Wellington" => 18.00
    }
  end

  def select_meals
    puts "Which dish do you want to order?"
    @dish_wanted = gets.chomp
    if menu.include? dish_wanted
      puts "How many #{@dish_wanted}s would you like?"
      @dish_wanted
    else
      "error"
    end
  end

end
