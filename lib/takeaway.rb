require_relative 'order_dispatch'

class Takeaway
  # Welcome to The Kaiser Chefs, how can we help?
  # Menu inspired by Dishoom. I recommend the Chicken Ruby.
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

  def self.build_with_dispatch
    new(OrderDispatch.new)
  end

  def initialize(order_dispatch)
    @dispatch = order_dispatch
  end

  # IDEA: extract into module
  def view_menu
    MENU.each do |k, v|
      printf "%-15s %15s\n", "#{k.to_s.tr('_',' ').capitalize}:", "£#{v}"
    end
  end

  def place_order(order)
    @dispatch.new_order(order)
  end

  # def print_receipt(order)
  #
  # end
end
