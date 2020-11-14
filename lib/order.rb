class Order
  attr_reader :cart
  INVALID_INDEX = 'selection not valid'

  def initialize(menu)
    @menu = menu
    @cart = []
  end

  def add_to_cart(index)
    raise INVALID_INDEX unless valid_index?(index)

    @cart << @menu.give_list[index - 1]
  end

  def total
    @cart.map(&:price).inject(0, :+)
    # prices = @cart.map do |dish|
    #   dish.price
    # end
    # prices.inject(0, :+)
  end

  def print_receipt
    puts "Thank you for your order!"
    @cart.each do |dish|
      puts "#{dish.name} #{dish.price}£"
    end
    puts "To be charged: #{total}£"
  end

  private

  def valid_index?(index)
    index.is_a?(Integer) && index <= @menu.give_list.length && index.positive?
  end
end
