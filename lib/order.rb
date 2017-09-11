require 'time'

class Order
  attr_reader :selection, :menu, :time

  def initialize(selection, menu)
    @selection = selection
    @menu = menu
  end

  def total
    total = 0
    selection.each do |item|
      total += @menu.items[item-1][1]
    end
    total
  end

  def view
    output = ""
    selection.each do |item|
      output += "#{@menu.items[item-1][0]} \t #{@menu.items[item-1][1]}\n"
    end
    output += "-----------------------\n"
    output += "total: \t #{total}"
    puts output
    return output
  end

  def confirm
    @time = Time.new
    "Thank you for your order! Your delivery will arrive before #{@time.hour+1}:#{@time.min}"
  end

end
