require 'dish'

describe Dish do

  let(:name) { double(:name)}
  let(:price) { double(:price) }
  let(:quantity) { double(:quantity) }
  subject(:dish) { described_class.new(name, price, quantity)}

  it {is_expected.to respond_to(:name)}
  it {is_expected.to respond_to(:price)}
  it {is_expected.to respond_to(:quantity)}

end
