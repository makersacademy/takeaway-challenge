require 'take_away'

describe TakeAway do
  # expect(subject).to receive(:send_text)
  context 'interactive menu' do
    it 'opens an interactive menu' do
      expect(TakeAway.new 'Frank\'s').to eq 'Hi, Welcome to #{self.class?}
          Would you like to:
            1. View menu
            2. Place an order
            3. Exit'
    end
    it 'can show the menu'
      take_away = TakeAway.new 'Frank\'s'
      expect(take_away.menu_list).to eq 'pizza: £10,
                                         burger: £2,
                                         kebab: £5,'
    end
  end

  context 'it can calculate price' do
    it 'can calculate the price of 3 different dishes' do
      take_away = TakeAway.new 'Frank\'s'
      expect(take_away.menu.values_at("burger", "burger", "pizza").to eq 14)
    end
    it 'can raise an error if price is not same as order total' do
      take_away = TakeAway.new 'Frank\'s'
      expect{ take_away.order( 'burger', 'burger', 'pizza', 13) }.to raise_error 'Not enough cash'
    end
end
