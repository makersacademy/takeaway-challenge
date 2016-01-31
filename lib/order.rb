# require_relative 'order'

class Order

  # FIXME: pass MENU (through dispatcher?)
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

  attr_reader :total

  def initialize(*args)
    @dishes = parse_dishes(args)
    @total = calculate_total
  end

  # def check_total(total)
  #
  # end

  def summary
    @dishes.clone.freeze
  end

  private

  # IDEA: get user input from command line
  def parse_dishes(args)
    order_hash = {}

    args.each do |dish|
      quantity, *dish_name = dish.split(' ')
      dish_sym = dish_name.join('_').downcase.to_sym
      message = "Sorry, we do not have #{dish_name.join(' ').capitalize}" \
      'on our menu.'
      fail message unless MENU.keys.include?(dish_sym)
      order_hash[dish_sym] = quantity.to_i
    end

    order_hash
  end

  def calculate_total
    @dishes.reduce(0) do |sum, (k, v)|
      sum + v * MENU[k]
    end
  end
end
