class Menu

  attr_reader :menu

  def initialize
    @menu = [
      { name: "beef burger", price: 5 }, 
      { name: "chicken burger", price: 5 }, 
      { name: "chicken popcorn", price: 3 },
      { name: "wrap", price: 5 },
      { name: "chips", price: 2 },
    ]
  end

# add dish to the menu attribute
  def add_dish(name, price)
    @menu << { name: name, price: price }
  end 

# view the menu
  def view_menu
    puts "~~~~That Chikkin' Shop~~~~"
    @menu.each do |dish|
      puts "#{dish[:name].capitalize} - £#{dish[:price]}."
    end
  end

# this method doesn't work - it's meant to remove dish from menu
  # def remove_dish(name)
  #   @menu.each do|dish|
  #     dish.delete(name)
  #   end
  # end

end
