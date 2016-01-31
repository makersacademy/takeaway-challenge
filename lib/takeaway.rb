require_relative 'order_dispatch'

# Welcome to The Kaiser Chefs, how can we help?
# Our menu is inspired by Dishoom, I recommend the Chicken Ruby.
MENU = {
  far_far:            2.5,
  samosas:            4,
  okra_fries:         4.2,
  mattar_paneer:      6.5,
  chicken_ruby:       8,
  masala_prawns:      9,
  biryani:            7.5,
  naan:               2.5,
  roti:               2.5,
  basmati_rice:       2,
  bhang_lassi:        3,
  thums_up:           2.5,
  kingfisher:         3.5,
  chai:               2,
  botal_water:        2
}.freeze

class Takeaway

  def self.build_with_dispatch
    new(OrderDispatch.build_with_client)
  end

  def initialize(order_dispatch)
    @menu     = MENU
    @dispatch = order_dispatch
  end

  # IDEA: extract into module
  def view_menu
    @menu.each do |k, v|
      printf "%-15s %15s\n", "#{k.to_s.tr('_',' ').capitalize}:", "£#{v}"
    end
  end

  def place_order(*args)
    order_details = parse_dishes(args)
    @dispatch.place_order(order_details)
  end

  private

  # IDEA: get user input from command line
  def parse_dishes(args)
    order_details = {}

    args.each do |dish|
      quantity, *dish_name = dish.split(' ')
      dish_sym = dish_name.join('_').downcase.to_sym
      message = "Sorry, we do not have #{dish_name.join(' ').capitalize} " \
      'on our menu.'
      fail message unless @menu.keys.include?(dish_sym)
      order_details[dish_sym] = quantity.to_i
    end

    order_details[:total] = calculate_total(order_details)
    order_details
  end

  def calculate_total(order_details)
    order_details.reduce(0) do |sum, (k, v)|
      sum + v * @menu[k]
    end
  end
end
