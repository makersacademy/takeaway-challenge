require 'dish'

describe Dish do
  subject(:dish) { described_class.new(name, price)}
  let(:name) {double(:string_name)}
  let(:price) { double(:string_price) }

  describe "#name" do
    it 'returns name' do
      expect(dish.name).to be(name)
    end
  end
  
  describe "#price" do
    it 'returns price' do
      expect(dish.price).to be(price)
    end
  end
end
