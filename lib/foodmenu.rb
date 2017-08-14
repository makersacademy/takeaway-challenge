class FoodMenu
  attr_reader :order_list

  def display
    @order_list.each do |x|
      puts "#{x[:index]}. #{x[:dish]} £#{x[:price]}"
    end
  end

  def initialize
    @order_list = [{ index: 1, dish: "Edamame", price: 2.50 },
                  { index: 2, dish: "Miso Soup", price: 1.95 },
                  { index: 3, dish: "Chicken Gyoza", price: 4.95 },
                  { index: 4, dish: "Salmon Nigiri", price: 2.95 },
                  { index: 5, dish: "Salmon Roe Gunkan", price: 4.95 }
                  ]
  end

end
# 
# def in_GBP(amount)
#   format("£%.2f", amount)
# end
