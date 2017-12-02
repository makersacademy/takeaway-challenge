class Restaurant

  attr_accessor :menu

  def initialize
    @menu = [
      {dish: 'Chicken' , price: 6},
      {dish: 'Pizza' , price: 10},
      {dish: 'Kebab', price: 4},
      {dish: 'Chips', price: 2},
      {dish: 'Fish', price: 5},
      {dish: 'Curry', price: 9}
    ]
  end

end
