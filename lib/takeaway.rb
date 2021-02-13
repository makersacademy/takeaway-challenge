class Takeaway
  attr_reader :menu, :basket

  def initialize
    @menu = {
      'bibimbap'=>10,
      'bulgogi'=>10,
      'naengmyeon'=>8
    }
    @basket = []
  end

  def add_to_basket(item)
    self.menu.map do |food, price|
      if item == food
        @basket.push("#{item}, #{price}")
      end
    end
  end

end
