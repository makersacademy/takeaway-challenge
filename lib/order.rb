class Order

  attr_reader :items

  def initialize
    @items = Hash.new
  end

  def add(item, n)
    item = item.name
    if !@items[item]
      items[item] = n
    else
      items[item] += n
    end
  end

end