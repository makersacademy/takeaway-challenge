require 'menu'

describe Menu do
  it 'contains all the dishes and the prices', :menu do
    expect(subject.pizza_menu).to eq({
      'Margeritta' => 10,
      'Pepperoni' => 12,
      'Ham' => 11,
      'Meat' => 14,
      'Vegetarian' => 11,
      'Fish' => 14,
      'Spicy' => 13
      })
  end

  # write test for testing display menu
  # it 'display a list of the dishes and prices', :displayfood do
  #   expect(subject.display_food_list).to eq "Margeritta Pizza = 10\nPepperoni Pizza - 12"
  # end


end
