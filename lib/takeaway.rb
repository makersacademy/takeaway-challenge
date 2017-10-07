
class Takeaway
  attr_reader :order

  def initialize
    @order = {}
  end

  def add(item)
    item = item.to_sym
    calculate_dishes(item)
    item 
  end

  def calculate_dishes(item)
    if order[item] == nil
      order[item] = 1
    else
      order[item] += 1
    end
  end


end
