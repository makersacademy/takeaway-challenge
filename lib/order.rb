class Order
  
  attr_reader :pad

  def initialize
    @pad = []
  end

  def select(index, menu, quantity = 1)
    raise 'That\'s not on the menu I\'m afraid' if invalid_selection?(index, menu)

    @pad << menu[index].merge(amount: quantity)
  end

  def remove(item_name, quantity)
    @pad.map do |item| 
      item[:amount] -= quantity if item[:name] == item_name
      delete_empty_items
    end
  end

  def delete_empty_items
    @pad.delete_if { |item| (item[:amount]).zero? }
  end

  def total
    @pad.map { |item| item[:cost] * item[:amount] }.inject(:+)
  end

  def clear_pad
    @pad = []
  end

  private 

  def invalid_selection?(index, menu)
    menu[index].nil?
  end
end
