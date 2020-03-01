class Dishes
  attr_reader :menu
  def initialize
    @menu = [{item: "Pizza", price:7},
      {item:"Fried Rice", price: 3 },
      {item: "Burger and Chips", price: 7}



      ]
  end

  def see_menu
    @menu.each { |item|
      puts "#{item[:item]} - £#{item[:price].to_s}"


    }
  end
end
