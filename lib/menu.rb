class Menu

  attr_reader :item, :full_list

  def initialize
    @item = {
              Chinese: 7.5,
              Indian: 8.0,
              Vietnamese: 6.0,
              Italian: 12.0,
              KFC: 4.5
            }
  end

  def full_list
    item.each { |x, y| puts "Dish: #{x}\nPrice: #{y}"}
  end

  def on_list?(input)
    raise "Choice not availble" if !@item.include?(input)
    true
  end


end
