require 'takeaway'

describe TakeAway do
  subject(:take_away) { described_class.new }

  it 'presents a list of dishes with prices' do
    expect(take_away.dishes).to include :hamburger
    expect(take_away.dishes).to include :pizza_deluxe
  end

  it 'allows users to select how many dishes to order out of each dish' do
    order = { hamburger: 1, pizza_deluxe: 2 }
    take_away.select(:hamburger, 1)
    take_away.select(:pizza_deluxe, 2)
    expect(take_away.current_order).to eq order
  end

  #TO DO - STUB TIME OBJECT
  describe '#place_order' do
    context 'customer places an order' do
      it 'returns a confirmation of the order' do
        take_away.select(:hamburger, 1)
        take_away.select(:pizza_deluxe, 2)
        t = Time.new + 60 * 60
        message = "Thank you! Your order was placed and will be delivered before #{t.strftime("%H")}:#{t.strftime("%M")}!"
        expect(take_away.place_order(take_away.current_order, 42)). to eq message
      end
    end
    context 'customer places order with wrong total amount' do
      it 'raises an error if input sum is not correct' do
        take_away.select(:hamburger, 1)
        take_away.select(:pizza_deluxe, 2)
        expect{ take_away.place_order(take_away.current_order, 45) }. to raise_error 'Not correct amount'
      end
    end
  end
end
