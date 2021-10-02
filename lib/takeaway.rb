# frozen_literial_string: true

class TakeAway
  def initialize(output)
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
    @menu.each { |key, value| @output.puts "#{key}: £#{value}" }
  end
end
