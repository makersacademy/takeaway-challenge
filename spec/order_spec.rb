require 'order'

describe Order do

subject(:order) {described_class.new(menu)}


let(:menu) {double ('menu')}
let(:quantity) {double ('quantity')}
let(:dish) {double ('dish')}

  describe '#add to order' do
    it 'Saves order in basket' do
      allow(menu).to receive(:has_dish?).with(dish).and_return(true)
      expect(subject.add(dish, quantity)).to eq([{dish: dish, quantity: quantity}])
    end
    it 'raises error if dish is not on the menu' do
      dish = :chips
      allow(menu).to receive(:has_dish?).with(dish).and_return(false)
      expect{ subject.add(dish, 4) }.to raise_error("#{dish} is not on the menu!")
    end
  end


  describe '#quantity_price' do

    before do

      allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
      allow(menu).to receive(:price).with(:burger).and_return(9.99)

    end

    it 'returns the quantity price of an order' do
      subject.add(:burger, 2)
      price = [19.98]
      expect(subject.quantity_price).to eq(price)
    end
  end

  describe '#total_price' do

    before do

      allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
      allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)

      allow(menu).to receive(:price).with(:burger).and_return(9.99)
      allow(menu).to receive(:price).with(:pizza).and_return(10.99)

    end

    it 'returns the total price of users order' do
      subject.add(:burger, 2)
      subject.add(:pizza, 3)
      total_price = 52.95
      expect(subject.total_price).to eq(total_price)
    end
  end
end
