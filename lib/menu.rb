class Menu
  attr_reader :display , :items

  def display
    puts items.each do |dish,price|
      "#{dish} : #{price}"
    end
  end
  
  def items
  { "bun" => 2.99, "pasta" => 4.99, "bread" => 0.99, "rice" => 5.99 }
  end
end
