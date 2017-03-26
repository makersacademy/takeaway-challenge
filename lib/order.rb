require_relative 'menu'
# Allows customer to place an order
class Order

  attr_reader :selection, :lookup
  def initialize
    @selection = []
    @menu = Menu.new.dishes
  end

  def add(quantity)
    input = $stdin.gets.chomp
    raise "Invalid selection: please select a number between 1 and "+ menu[-1][:number].to_s  if input > menu[-1][:number].to_s
    lookup = menu.select { |hash| hash[:number].to_s == input}
    addition = lookup[0].select {|key, value| [:dish, :price].include?(key) }
    quantity.times { self.selection << addition }
  end

  private
  attr_reader :menu

end
