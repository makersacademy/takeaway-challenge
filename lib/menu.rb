class Menu

  attr_reader :mains, :desserts

  def initialize
    @mains = [{name: "Lasagna", price: "£10"}, {name: "Burger", price: "£5"}]
    @desserts = [{name: "Icecream", price: "£5"}, {name: "Cake", price: "£3"}]
  end

  def show_mains
    puts "Mains:"
    mains.each do |hash|
      puts "#{hash[:name]}, #{hash[:price]}"
    end
  end

  def show_desserts
    puts "Desserts:"
    desserts.each do |hash|
      puts "#{hash[:name]}, #{hash[:price]}"
    end
  end

  def add_main(dish, price)
    mains << { name: dish, price: "£#{price}" }
  end

  def add_dessert(dish, price)
    desserts << { name: dish, price: "£#{price}" }
  end

end
