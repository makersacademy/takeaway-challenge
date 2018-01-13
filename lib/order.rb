class Order

  attr_reader :full_order

  def initialize
    @full_order = []
  end

  def add_to_order(item)
    @full_order << item.to_sym
  end

end

# item = gets.chomp.to_sym
