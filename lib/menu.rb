require 'order'

class Menu
  attr_reader :menu, :order
  NORMAL_MENU = {
    salmon_set: 10,
    tuna_set: 10,
    mixed_sashimi: 9,
    crab_rolls: 6,
    nigiri_sashimi_mix: 12,
    nigiri_sashimi_mix_deluxe: 15,
    katsu_curry: 8,
    lunch_bento: 8,
    water: 2,
    kombucha: 3,
  }
  def initialize(menu = NORMAL_MENU)
    @menu = menu
    @order
  end

  def print_dishes
    puts 'Our tasty menu:'
    @menu.map { |dish, price| 
      puts "#{dish.to_s.gsub(/_/, ' ').capitalize} : £#{sprintf "%.2f", price}" 
    }
  end

  def select_dishes(dish, quantity)
    existing_order
    @order.add_item(dish, quantity)
  end

  def existing_order
    @order ||= Order.new
  end
end
