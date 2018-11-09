class Takeaway

  attr_accessor :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def display_menu
    puts "Here is the menu: \n\n"
    @dishes.each do |dish|
      puts dish
    end
  end
end
