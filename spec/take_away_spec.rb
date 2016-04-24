require 'takeaway'

describe TakeAway do
  subject(:take_away) { described_class.new }
  let(:message) { double :message }
  let(:confirm_order) { double("confirm_order") }
  let (:t) { Time.new + 60*60 }
  let (:pizza_price) { 15 }
  let (:hamburger_price) { 12 }

  it 'presents a list of dishes with prices' do
    expect(take_away.dishes).to include :pizza_deluxe
  end

  describe '#select' do
    it 'raises an error if customer tries to add non-existing dish' do
      message = 'No such dish'
      expect{ take_away.select(:hand_grenades, 300) }.to raise_exception message
    end
    it 'allows users to select how many dishes to order out of each dish' do
      order = { hamburger: 1, pizza_deluxe: 2 }
      take_away.select(:hamburger, 1)
      take_away.select(:pizza_deluxe, 2)
      expect(take_away.current_order).to eq order
    end
  end

  describe '#place_order' do
    context 'customer places an order' do
      it 'returns a confirmation of the order' do
        take_away.select(:hamburger, 1)
        take_away.select(:pizza_deluxe, 2)
        message_body = "Thank you! Your order will be delivered before #{t.strftime("%H")}:#{t.strftime("%M")}!"
        expect(take_away.place_order((1*hamburger_price) + (2*pizza_price))).to eq message_body
      end
    end
    context 'customer places order with wrong total amount' do
      it 'raises an error if input sum is not correct' do
        take_away.select(:hamburger, 1)
        take_away.select(:pizza_deluxe, 2)
        message = 'Not correct amount'
        expect{ take_away.place_order(3*pizza_price) }.to raise_exception message
      end
    end
  end

  describe '#order_history' do
    it 'presents previous orders' do
      take_away.select(:pizza_deluxe, 2)
      take_away.place_order(2*pizza_price)
      expect(take_away.order_history).not_to eq nil
    end
  end

end
