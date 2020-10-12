class TakeawayMenu
  attr_reader :dish_wanted, :chosen_meals

  def initialize
    @dish_wanted = 0
    @chosen_meals = []
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
    # loop do
      @dish_wanted = gets.chomp
      if menu.include? dish_wanted
        puts "How many #{@dish_wanted}s would you like?"
        chosen_meals << @dish_wanted
        # print chosen_meals
        # break
      else
        puts "Which dish do you want to order?"
        # break
      end
    # end
  end

end
