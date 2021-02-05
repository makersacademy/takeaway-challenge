require 'takeaway'
require 'current_order'

describe Takeaway do

  TEST_MEAL = 'Mega Breakfast'
  TEST_ORDER = { item: "Mega Breakfast", price: 6.75 }
  let(:send_message) { double }

  describe '#menu' do
    it 'returns a list of menu' do
      expect(subject.menu).to eq(subject.menu)
    end
  end

  describe '#choose_meal' do
    it 'selects a meal from the menu' do
      expect(subject.choose_meal(TEST_MEAL)).to eq([TEST_ORDER])
    end
  end

  describe '#confirm_order' do
    it 'Confirms the order and gives the correct price.' do
      subject.choose_meal(TEST_MEAL)
      subject.choose_meal(TEST_MEAL)
      expect(subject.confirm_order).to eq(13.5)
    end
  end

  describe '#pay_for_order' do
    it 'Clears a customers order and sends a text' do
      allow(subject).to receive(:send_message) { nil }
      subject.choose_meal(TEST_MEAL)
      subject.choose_meal(TEST_MEAL)
      expect(subject.pay_for_order).to eq([])
    end
  end
end
