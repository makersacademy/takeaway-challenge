class List

  attr_reader :list
  def initialize(list = [{ id: 1, name: "Kebap", price: 1.0 },
                         { id: 2, name: "Breakfast", price: 2.0 },
                         { id: 3, name: "Pizza", price: 3.0 }])
    @list = list
  end
end
