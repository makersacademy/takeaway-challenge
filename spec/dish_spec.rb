require 'dish'

describe Dish do

  let(:dish_name) { double(:dish_name)}
  let(:price) { double(:price) }
  let(:quantity) { double(:quantity) }
  subject(:dish_class) { described_class.new(dish_name, price, quantity)}

  it {is_expected.to respond_to(:dish)}
  it {is_expected.to respond_to(:price)}
  it {is_expected.to respond_to(:quantity)}

end
