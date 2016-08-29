require_relative 'menu'

class Selection
include Menu

  def initialize
  end

  def select_items
    prompt = "These are the available dishes #{Menu::MENU}, please make your selection. Return twice to quit"
    quant_msg = "How many of these would you like?"
    STDOUT.puts prompt
    order = []
    selection = STDIN.gets.chomp.downcase

    while !selection.empty?
      puts quant_msg
      quantity = STDIN.gets.chomp.downcase
      order << {food: selection, quantity: quantity}
      p 'next selection?'
      selection = STDIN.gets.chomp.downcase
    end
    order
  end



end
