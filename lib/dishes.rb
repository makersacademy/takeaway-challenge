class Dishes
  attr_reader :menu
  
  def initialize
    @menu = [
      {name: "Diet (not really) Pizza", price: 5.99},
      {name: "Make me fat Pizza", price: 6.99},
      {name: "Easy-Peasy Pizza", price: 7.99},
      {name: "Hold my beer Pizza", price: 8.99},
      {name: "Once in a lifetime Pizza", price: 9.99}
    ]
  end

  def show_dishes
    @menu.each_with_index { |meal, index| 
      puts "#{index + 1}. #{meal[:name]} £#{meal[:price]}"
    }
    @menu
  end

  def dish_available?(index)
    @menu[index] != nil
  end
end
