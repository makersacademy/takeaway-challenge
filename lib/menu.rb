class Menu
  attr_reader :dishes
  def initialize
    @dishes = [
      {number: 1, dish: 'Chicken Biryani', price: 8.99},
      {number: 2, dish: 'Vegetable Dansak', price: 7.99},
      {number: 3, dish: 'Rogan Josh', price: 9.49},
      {number: 4, dish: 'Chicken Korma', price: 9.99}
    ]
  end

  def list_dishes
    @dishes.each do |dish|
      "Number #{dish[:number]}".center(10) + "||".center(5) + "#{dish[:dish]}".center(15) + "£#{dish[:price]}".center(15)
    end
  end

end
