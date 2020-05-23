# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

class Menu

  MENU_LIST = [
    { num: 1, item: "Spare ribs", price: 5.99 },
    { num: 2, item: "Spring rolls", price: 3.50 },
    { num: 3, item: "Chicken Chow mein", price: 6.00 },
    { num: 4, item: "Fried rice", price: 6.50 }
  ]

  def view
    MENU_LIST.each do |item|
      puts "Item #{item[:num]}: #{item[:item]} - £#{item[:price]}"
    end
  end
  
end
