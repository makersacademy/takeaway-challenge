class Order
  attr_reader :items
  def initialize
    @items = Hash.new
  end
  
  def add_item(name)
    if @items.has_key?(name)
      @items[name] += 1
    else
      # adds item to hash
      @items[name] = 1
    end
  end
  
  def remove_item(name)
    if @items.has_key?(name)
      @items[name] -= 1
      # as long as value is not zero it will return false
      unless @items[name]
        @items.delete(name)
      end
    end
  end
end
