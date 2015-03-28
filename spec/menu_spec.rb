require 'menu'

describe Menu do
  context ': Customer wants to make an order, ' do
    it 'lists dishes with prices' do
      expect(subject.list[0..28]).to eq "flame_grilled_pheonix: £12.00"
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
