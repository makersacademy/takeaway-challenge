require_relative 'order'

class Takeaway
  # Menu inspired by Dishoom. I recommend the Chicken Ruby
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
  }

  # IDEA: order_log and/or despatcher
  def initialize(order_klass = ::Order)
    @order_klass = order_klass
    @order = nil
  end

  def view_menu
    MENU.each do |k, v|
      printf "%-15s %15s\n", "#{k.to_s.gsub(/_/, ' ').capitalize}:", "£#{v.to_s}"
    end
  end

  def place_order(*dishes)
    @order = @order_klass.new(parse_dishes(*dishes))
  end

  private

  def parse_dishes(*dishes)
    dish_hash = {}

    dishes.each do |dish|
      quantity, *dish_name = dish.split(' ')
      dish_sym = dish_name.join('_').downcase.to_sym
      message = "Sorry, we do not have #{dish_name.join(" ")} on our menu."
      fail message unless MENU.keys.include?(dish_sym)
      dish_hash[dish_sym] = quantity.to_i
    end

    dish_hash
  end
end
