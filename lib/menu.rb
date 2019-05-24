class Menu
  attr_reader :display , :items

  def display
    items.each do |dish,price|
      puts "#{dish}: #{price}"
    end
  end
  
  def items
    { "pasta" => 4.99, "bread" => 0.99, "rice" => 5.99 }
  end
  
  def price(dish)
    items[dish]
  end
end