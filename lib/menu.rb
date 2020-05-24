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

  def select(num)
    MENU_LIST.each do |meal|
      return {item:meal[:item], price:meal[:price]} if meal[:num] == num
    end
  end
end
