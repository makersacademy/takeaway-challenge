require 'dish'

describe Dish do

subject(:dish) {described_class.new(:name, :price)}

  describe '#initialize' do
    it {is_expected.to respond_to(:price)}
    it {is_expected.to respond_to(:name)}
  end
end