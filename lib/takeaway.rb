# frozen_literial_string: true

class TakeAway
  attr_reader :basket

  def initialize(output)
    @basket = []
    @output = output
    @menu = {
      'spring roll' => 0.99,
      'char sui bun' => 3.99,
      'pork dumpling' => 2.99,
      'peking duck' => 7.99,
      'fu-king fried rice' => 5.99
    }
  end

  def read_menu
    menu.each { |key, value| output.puts "#{key}: £#{value}" }
  end

  def add_dish(dish)
    check_for_string(dish)
    return print_error_message unless menu.keys.any?(dish.downcase)

    @basket << menu.select { |key| key == dish.downcase }
  end

  private

  attr_reader :output, :menu

  def print_error_message
    output.puts 'item not on menu'
  end

  def check_for_string(dish)
    raise 'item off menu required' unless dish.kind_of?(String)
  end
end
