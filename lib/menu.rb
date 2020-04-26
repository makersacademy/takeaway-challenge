class Menu
  
  attr_reader :items

  def initialize
    @items = []
  end

  def add_dish(name, price)
    @items << { name: name, price: price }
  end

  def list
    @items.each_with_index do |dish, index|
      puts "#{(index + 1)}. #{dish[:name]}, £ #{dish[:price]}"
    end
  end

  def header
    puts "Jock'O'Byte - Take Away Menu".center(42)
    puts "------------------------------------------"
  end

  def footer
    puts "* Mony braw dishes fer ye tae choose fae *"
  end

end
