require_relative './menu.rb'

class Order

  attr_reader :total

# Should be passed an array with items listed, and the total as the last item
  def initialize(options = [])
    calculate_total(options)
    compare_totals(options)
  end

  private

  def calculate_total(options = [])
    @menu = Menu.new
    @total = 0
    options.each { |item| @total += @menu.list[item] if (@menu.list[item] != nil) }
    @total
  end

  def compare_totals(options = [])
    raise "Your totals don't match!" if @total != options[-1]
    puts "The confirmed total of your order is £#{@total}"
  end

end
