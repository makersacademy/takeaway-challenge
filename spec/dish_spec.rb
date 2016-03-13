require 'dish'

describe Dish do

  let(:name) { double(:name)}
  let(:price) { double(:price) }
  subject(:dish) { described_class.new(name, price)}

  it {is_expected.to respond_to(:name)}
  it {is_expected.to respond_to(:price)}

end
