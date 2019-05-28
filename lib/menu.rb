# Creates a menu of takeaway items and displays menu
class Menu
  attr_reader :display , :items

  def display
    items.each do |dish,price|
      "#{dish}: #{price}"
    end
  end
  
  def items
    { "pasta" => 4.99, "bread" => 0.99, "pizza" => 5.99 } # => muttable
    # { pasta: 4.99, bread: 0.99, pizza: 5.99 } # => immuttable (needs to add .to_s for user input)
  end
  
  def price(dish)
    items[dish]
  end
end