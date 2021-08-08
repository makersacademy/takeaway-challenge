require './lib/confirmation_text'

class Order

  # requires "menu" to be an array of hashes

  def initialize(menu)
    @menu = menu
    @order = []
  end

  def select_order
    get_user_input.each {|number| @order.push(@menu.items[number - 1]) }
    @order
  end

  def cost
    @order.map { |item| item.values[0] }.sum
  end


  def complete_order
    @menu.print_menu
    order_instructions
    select_order
    cost
  end


  private

  def order_instructions
    puts "Please type the item number code one at a time, followed by enter. Once complete, to submit your order enter 'confirm'"
  end

  def invalid?(input)
    menu_length = @menu.items.count
    !(input.to_i.between?(1,menu_length+1))
  end

  def get_user_input
    input = gets.chomp
    selections = []
    until input.upcase == "CONFIRM"
      if invalid?(input)
        puts "Sorry! That's not an option, please try again ('confirm' to complete order)"
        input = gets.chomp
        next
      end
      selections.push(input.to_i)
      input = gets.chomp
    end
    selections
  end

  def send_confirmation_text
    ConfirmationText.new.send_order_confirmation
  end

end