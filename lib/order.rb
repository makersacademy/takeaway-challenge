require_relative 'menu'

class Order

  attr_reader :list

  def initialize
    @list = []
    @menu = Menu.new
  end

  def choose_from_menu
    puts "Would you like to order something?"
    puts "Enter the tea or finish"
    @menu.view
    input = gets.chomp
    if input != ""
      select_tea(input)
    end
  end

  def select_tea(input)
    selection = (@menu.select_tea(input))
    selection = patch_selected_all(selection) # I don't know why this happens and I can't stop it
    if selection != nil
      select_amount(selection)
    end
  end

  def select_amount(selection)
    puts "how many would you like?"
    number = gets.chomp
    number.to_i.times {@list.push(selection)}
  end

  def patch_selected_all(selection) # if a string that isn't in any of the keys is input, it gives the whole menu back
    if selection == @menu.menu_items
      nil
    else
      selection
    end
  end
end
