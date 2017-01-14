require 'dish'

describe Dish do

  subject(:dish) { described_class.new("dumplings", 6) }
  # let(:name) { double :name }
  # let(:price) { double :price }

  context 'on initialization' do
    it 'has a name and a price' do
      expect(dish).to have_attributes(name: "dumplings", price: 6)
    end
  end
end
