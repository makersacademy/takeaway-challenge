class Order

  def initialize
  end

  def place_order(list, total)
    calculate(list)
    raise "Incorrect amount paid." unless correct?
  end


private
  attr_reader :total

  def calculate(list)

  end

  def correct?
    true
  end

end
