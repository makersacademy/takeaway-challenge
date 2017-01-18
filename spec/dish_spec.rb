require 'dish'

describe Dish do

  # --------------------------------- NAMED SUBJECT ----------------------------------

  subject(:dish) { described_class.new('Margherita Pizza', 8.45) }

  # ---------------------------------- ACTUAL TESTS ----------------------------------

  it 'should have two instance variables for name and price' do
    expect(dish).to have_attributes(name: 'Margherita Pizza', price: 8.45)
  end

end
