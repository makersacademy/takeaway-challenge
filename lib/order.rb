require_relative 'menu'

class Order

  attr_reader :menu, :selections

  def initialize(menu)
    @menu = menu.items
    @menu.each { |food, price| puts "#{food.capitalize}: £#{price}" }
    @selections = []
  end

  def selection
    puts "What would you like to order?"
    until choice.nil?
      puts "If you would like another item(s), please enter them now\nReturn twice to begin checkout"
    end
    print_selection
  end

  def choice 
    choice = STDIN.gets.chomp!
    @selections << choice.to_sym if !choice.nil? && @menu.include?(choice.to_sym)  
  end

  def print_selection
    total = 0
    @selections.each { |item|
      total += @menu[item] 
    puts "#{item.capitalize}: £#{@menu[item]}" }
    puts "Total: £#{total}"
  end



private

def raise_error
  raise "Totals do not match"  
end

end