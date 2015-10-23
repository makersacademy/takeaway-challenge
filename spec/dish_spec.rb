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

  context 'Quantity' do
    it {is_expected.to respond_to(:quantity)}

    it 'returns an zero quantity when a new Dish is created' do
      expect(burger.quantity).to eq 0
    end

    it {is_expected.to respond_to(:update_quantity).with(1).argument}

    it 'updates the quantity' do
      burger.update_quantity(1)
      expect(burger.quantity).to eq 1
    end

    it 'can\'t have a negative quantity' do
      expect {burger.update_quantity(-1)}.to raise_error "Quantity is negative"
    end
  end
end
