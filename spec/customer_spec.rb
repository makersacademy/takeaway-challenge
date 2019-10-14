require './docs/customer'

describe Customer do

  it 'orders meals' do
    # Arrange
    restaurant = Restaurant.new
    # Act
    restaurant.menu
    subject.customer_order
    # Assert
    expect(subject.customer_order_array).to include({:amount_ordered=>"3",
       :customer_meal=>"pesto pasta"})
  end
end
