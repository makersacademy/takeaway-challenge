class Dishes

  attr_reader :list

  def initialize
    @list = [
      { name: "Chop Suey", price: 15.99 },
      { name: "Thai Curry", price: 11.99 },
      { name: "Singapore Noodles", price: 9.99 }
    ]
  end

  # def add_item(name, price)
  #   @list << { name: name, price: "£#{price}" }
  # end

end
