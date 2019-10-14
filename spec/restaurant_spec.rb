require './docs/restaurant'

describe Restaurant do
  it 'lists the dishes with their prices' do
    # Arrange
    restaurant = Restaurant.new
    # Act
    show_menu = restaurant.menu
    # Assert
    expect(show_menu).to eq("Here is a list of our dishes: #{subject.list_dishes}")
  end
end
