class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(item, quantity)
    update_basket(item, quantity)
    "#{quantity}x #{item}(s) added to your basket."
  end

  private

  def update_basket(item, quantity)
    @basket << {item => quantity}
  end
end