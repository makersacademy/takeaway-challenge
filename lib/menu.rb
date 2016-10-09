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
    item.each { |dish, price| puts "Dish: #{dish}\nPrice: £#{price}"}
  end

  def on_list?(input)
    raise "Choice not availble" if !item.include?(input)
    item[input.to_sym]
  end


end
