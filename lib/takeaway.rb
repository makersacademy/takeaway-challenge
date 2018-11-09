class Takeaway

  attr_accessor :dishes, :basket

  def initialize(dishes)
    @dishes = dishes
    @basket = []
  end

  def display_menu
    puts "Here is the menu: \n\n"
    @dishes.each do |dish|
      puts dish
    end
    puts
  end

  def order(item)
    @dishes.each do |dish|
      if dish.name.start_with? item
        @basket << dish
        puts "#{dish.name} added to your basket. \n \n"
      end
    end
  end
end
