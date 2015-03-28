require 'restaurant'

describe Restaurant do
  context ': Customer wants to make an order, ' do
    it 'lists dishes with prices' do
      expect(subject.list[0..28]).to eq "flame_grilled_pheonix: £12.00"
    end

    it 'returns message when order placed' do
      restaurant = described_class.new(steak: 2000, chips: 200)
      order = { steak: 1, chips: 1 }
      allow(Time).to receive(:now) { Time.new(2015, 03, 28, 17, 30, 11) }
      total = "22.00"
      expect(restaurant.place(order, total)).to eq(
        'Thanks for your order, it should arrive before 18:30.')
    end

    it 'creates a total cost' do
      restaurant = described_class.new(steak: 2000, chips: 200)
      order = { steak: 1, chips: 1 }
      expect(restaurant.total(order)).to eq "22.00"
    end

    it 'raise error if total is not accurate' do
      restaurant = described_class.new(steak: 2000, chips: 200)
      order = { steak: 1, chips: 1 }
      incorrect_total = 10
      expect { restaurant.place(order, incorrect_total) }.to raise_error
    end
  end

  context 'Restaurant owner wants to edit menu' do
    it 'can add items to menu' do
      subject.add(steak: 900)
      expect(subject.list[-13..-1]).to eq "steak: £9.00\n"
    end
    it 'can change prices in menu' do
      subject.add(pickled_strawberry: 350)
      expect(subject.list[-26..-1]).to eq "pickled_strawberry: £3.50\n"
    end
  end
end
