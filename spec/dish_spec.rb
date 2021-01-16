require 'dish'

describe Dish do
    subject(:dish) { described_class.new(:name, :price) }

    # it { is_expected.to respond_to(:price) }
    # it { is_expected.to respond_to(:name) }

    it 'expects to be initialized with a name' do
        expect(dish.name).to eq :name
    end

    it 'expects to be initialized with a price' do
        expect(dish.price).to eq :price
    end
end