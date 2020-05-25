require 'csv'

class Basket
  def initialize(customer_order)
    @customer_order = customer_order
    @basket_data = []
  end

  def show_basket
    store_menu_data
    populate_basket_data
    header
    basket_breakdown
    footer
  end

  private

  def header
    puts "BASKET"
    puts "=" * 39
  end

  def footer
    puts "-" * 39
    puts "TOTAL:".ljust(32, ' ') + "£%.2f" % basket_total
  end

  def basket_total
    @basket_data.reduce(0) { |sum, order| sum + order[:subtotal] }
  end

  def basket_breakdown
    @basket_data.each do |order|
      puts "#{order[:quantity]}x".ljust(5, ' ') +
           "#{capitalise_item(order[:dish])}(s)".ljust(26, ' ') +
           " £#{order[:subtotal]}"
    end
  end

  def populate_basket_data
    @customer_order.each do |dish, quantity|
      @basket_data << { dish: dish, quantity: quantity, subtotal: sub_total(dish, quantity) }
    end
  end

  def sub_total(dish, quantity)
    store_menu_data
    (@menu_data[dish].to_f * quantity).round(2)
  end

  def capitalise_item(item)
    item.split.map { |word| word.capitalize }.join(" ")
  end

  def store_menu_data
    @menu_data = load_data('../menu.csv')
  end

  def load_data(file_path)
    data = {}
    CSV.foreach(file_path) do |line|
      dish, price = line
      data[dish] = price
    end
    data
  end
end
