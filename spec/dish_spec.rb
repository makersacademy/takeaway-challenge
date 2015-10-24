require 'dish'

describe Dish do
  let(:description) {"Cheeseburger"}
  let(:price) {4.99}
  subject(:burger) {described_class.new(description: description, price: price)}

  context 'Description' do
    it {is_expected.to respond_to(:description)}

    it 'returns its description when asked' do
      expect(burger.description).to eq description
    end
  end

  context 'Price' do
    it {is_expected.to respond_to(:price)}

    it 'returns its price when asked' do
      expect(burger.price).to eq price
    end
  end

  context 'Print' do
    it 'prints the description and price' do
      expect(burger.to_s).to eq "#{description}\t#{price}"
    end
  end
end
