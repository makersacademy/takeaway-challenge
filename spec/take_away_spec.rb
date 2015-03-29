require 'take_away'

describe TakeAway do
  expect(subject).to receive(:send_text)
  context 'interactive menu' do
    it 'opens an interactive menu' do
      expect(TakeAway.new).to eq 'Hi, Welcome to #{self.class?}
          Would you like to:
            1. View menu
            2. Place an order
            3. Exit'
    end
    it 'can show the menu'
      take_way = TakeAway.new

  context 'it can calculate price' do
    it 'can calculate the price of 3 different dishes' do
      take_away = TakeAway.new
      expect(take_away.order "burger", "burger", "pizza", 14).to eq 'Text has been sent'
    end
    it 'can raise an error if price is not same as order total' do
      take_away = TakeAway.new
      expect{ take_away.order( 'burger', 'burger', 'pizza', 13) }.to raise_error 'Not enough cash'
    end
  context 'time calculation'
    it 'can know the time' do
  end
end
