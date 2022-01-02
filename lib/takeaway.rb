
class Takeaway
  
  def initialize
    @menu = [
      { name: "Beef burger", price: 14 },
      { name: "Chicken burger", price: 12 },
      { name: "Hot dog", price: 11 },
      { name: "Fries", price: 4 },
      { name: "Soft drink", price: 3 },
      { name: "Milkshake", price: 5 }
    ]
  end

  def menu
    @menu.each do |item|
      puts "#{item[:name]}: #{item[:price]}"
    end
  end
end
