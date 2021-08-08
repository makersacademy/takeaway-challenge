class Order

  # requires "menu" to be an array of hashes

  def initialize(menu)
    @menu = menu
    @order = []
  end

  def select_order
    get_user_input.each {|number| @order.push(@menu[number - 1]) }
    @order
  end

  def cost
    @order.map { |item| item.values[0] }.sum
  end




  private

  def get_user_input
    input = gets.chomp
    selections = []
    until input.upcase == "CONFIRM"
      selections.push(input.to_i)
      input = gets.chomp
    end
    selections
  end

  # def confirmation_text
  #   @confirmation_text_class.new.send_order_confirmation
  # end

end