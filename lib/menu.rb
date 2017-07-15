class Menu

  def initialize
    @menu = {
      1 => ["Burger", 5.50],
      2 => ["Pizza", 5.00]
    }
  end

  def print
    @menu.each { |number, dish| puts "#{number}: #{dish[0]}, £#{'%.02f' % dish[1]}\n" }
  end

  def selection(numbers)
    order_hash = Hash.new { 0 }
    numbers.each { |order| order_hash[@menu[order]] += 1 }
    order_hash
  end

end
