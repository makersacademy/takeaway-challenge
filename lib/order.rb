class Order

  attr_reader :options
  attr_accessor :current

  def initialize(options)
    @options = options
    @current = {}
  end

  def total
    calculate_total
    display_order
  end

  def place_order(current, expected_total)
    calculate_total
    raise"Sorry mate- but your total is actually #{@total}" if expected_total != @total
  end

  def choose(dish, quantity)
    raise "Sorry mate- #{dish} is not on the menu!" unless on_menu?(dish)
    @current[dish] = quantity
    @current
  end

  private

  def on_menu?(dish)
    @options.include?(dish)
  end

  def calculate_total
    @total = 0
    @current.each {|key, value| @total += value * @options[key] }
  end

  def display_order
    @current.each {|key, value| puts "#{value} #{key}: #{@options[key]} each" + "  " }
    "total: #{@total}"
  end

end
