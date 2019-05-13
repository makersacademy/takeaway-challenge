require_relative 'menu'
require_relative 'texting'

class Order

  attr_reader :list, :total, :formatted_order

  def initialize
    @list = []
    @menu = Menu.new
    @total = 0
    @formatted_order = ""
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

  def checkout
    calculate_total
    @formatted_order = format_order
    check_order
  end

  def calculate_total
    t = 0
    list.each do |i|
      i.each do |key, value|
        t += value
      end
    end
    @total = t
  end

  def format_order
    chosen_items = ""
    list.each do |i|
      i.each do |key, value|
        chosen_items += "\n- #{key}, £#{value}"
      end
    end
    chosen_items += "\n\n- Total:           £#{@total}\n\n"
    @formatted_order = chosen_items
  end

  def check_order
    puts @formatted_order

    puts "Is this correct?"
    puts "Enter yes to place order or no to cancel."
    input = gets.chomp
    raise "cancelled" if input != "yes"
    send_confirmation

  end

  def send_confirmation
    raise("You can't place an empty order!") if @total == 0
    confirmation = Texting.new()
    confirmation.send_text
    reset_order
    confirmation.confirmation
  end

  def reset_order
    @list = []
    @formatted_order = ""
  end

end
