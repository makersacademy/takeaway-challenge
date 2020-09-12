class Order

  attr_reader :list

  def initialize
    @list = []
  end

  def add(dish)
    @list << dish
  end

  def finalise
    send_text
    @list = []
  end

  def send_text
    "Thank you! Your order was placed and will be delivered before 18:52"
  end


end