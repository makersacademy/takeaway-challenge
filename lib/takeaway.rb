class Takeaway
  attr_accessor :dishes
  attr_reader :selected

  def initialize
    @dishes = [{ name: "Pizza", price: 20 },
      { name: "Kebab", price: 12 },
      { name: "Kebab", price: 12 },
      { name: "Sushi", price: 22 },
      { name: "Burger", price: 10 }
    ]
    @selected = []
  end  

  def see_dishes
    dishes.each do |dish|
      puts "Name: #{dish[:name]} |||| Price: £#{dish[:price]}\n"
    end
  end

  def select_dish

  end

end
