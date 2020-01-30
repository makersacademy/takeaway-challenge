class Takeaway
  attr_reader :orders, :total_cost

  def initialize
    @total_cost = 0
    @orders = []
  end

  MENU = {
    1 => {dish: "Egg Paneer Kathi Roll", cost: 4},
    2 => {dish: "Margharita Pizza", cost: 7},
    3 => {dish: "Prawn Laksa", cost: 8},
    4 => {dish: "Pho", cost: 6},
    5 => {dish: "Roast Lamb and veg", cost: 16},
    6 => {dish: "Poached egg and spinach", cost: 6},
    7 => {dish: "Khao Soi", cost: 9},
    8 => {dish: "Tofu Amok", cost: 5},
    9 => {dish: "Mushroom burger", cost: 10},
    10 => {dish: "Pastel de Nata", cost: 2}
  }
  def show_menu
    MENU.each do |k,v|
      puts "#{k}. #{v[:dish]} - £#{v[:cost]}"
    end
  end

  def order_item(num, quantity = 1)
    @total_cost += MENU[num][:cost] * quantity
    @orders << {dish: MENU[num][:dish], cost: MENU[num][:cost], quantity: quantity} 
  end
end
