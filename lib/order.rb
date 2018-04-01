require_relative 'menu'
class Order
  attr_reader :order_items

  def initialize
    @order_items = {}
  end


  def save_items(menu_options)
    loop do
      selection = get_selection
      break if selection.empty?

      raise "We don't currently serve this dish!" if menu_options[selection].nil?
      quantity = get_quantity
      @order_items[selection] = quantity
    end
    'order noted'
  end

  def check_order(menu_options)
    puts "You ordered:"
    summary_of_order(menu_options)
    puts " Total: £#{order_total(menu_options)}"

    'order verified'
  end


  private

  def get_selection
    puts "What would you like to order? Press return to finish"
    selection = STDIN.gets.chomp
    selection = selection.gsub(/\s+/,'_').downcase.to_sym

  end

  def get_quantity
    puts "How many would you like?"
    quantity = STDIN.gets.chomp.to_i

  end

  def summary_of_order(menu_options)
    @order_items.each do |item, quantity|
    puts " #{quantity} x #{item.to_s.gsub('_', ' ')} - £#{menu_options[item.to_s.gsub(/\s+/, '_').to_sym]} each"
    end
  end

  def order_total(menu_options)
    amounts = []
    @order_items.each do |item, quantity|
      amounts << menu_options[item] * quantity
    end

    amounts.reduce(:+).to_s

    end
  end
