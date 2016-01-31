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
    vegetable_biryani:  7.5,
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
  def initialize(order_klass = Order)
    @order_klass = order_klass
  end

  def view_menu
    MENU.each do |k, v|
      puts k.to_s.gsub(/_/, ' ').capitalize + ': £' + v.to_s
    end
  end

  def place_order(*dishes, total)
    @order_klass.new(*dishes)
  end
end
