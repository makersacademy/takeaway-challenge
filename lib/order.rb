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
    raise "Invalid selection: please select a number between 1 and " + menu[-1][:number].to_s  unless input.to_i.between?(1, menu[-1][:number])
    lookup = menu.select { |item| item[:number].to_s == input}
    addition = lookup[0].select {|key, value| [:dish, :price].include?(key) }
    quantity.times { self.selection << addition }
  end

  def review
    selection.each do |item|
      puts "#{item[:dish]}: £#{item[:price]}"
    end
  end

  def total
    total = 0
    selection.each { |item| total += item[:price] }
    total
  end

  private
  attr_reader :menu

end
