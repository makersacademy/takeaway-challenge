require 'dish'

describe Dish do
  subject(:dish) { described_class.new(name: "Steak", price: 25) }

  describe '#initialize' do
    it 'knows its name' do
      expect(dish.name).to eq "Steak"
    end

    it 'knows its price' do
      expect(dish.price).to eq 25
    end
  end

  describe '#set_details' do
    let(:item) { { :name => "Steak", :price => 25 } }
    it 'shows full details of the dish' do
      expect(dish.set_details).to eq item
    end
  end
end
