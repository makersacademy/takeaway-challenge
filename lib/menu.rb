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
    numbers.each_with_object(Hash.new { 0 }) do |order, hash|
      fail "Number #{order} is not a valid dish" unless @menu[order]
      hash[@menu[order]] += 1
    end
  end

end
