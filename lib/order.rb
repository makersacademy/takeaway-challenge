class Order
  attr_reader :items
  
  def initialize
    @items = []
  end

  def add(*to_add)
    @items.push(*to_add)
  end

  def remove(*to_remove)
    to_remove.each do |item|
      index = @items.find_index(item)
      @items.delete_at(index) if index
    end
  end
end
