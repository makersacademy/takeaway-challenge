require 'order'
require 'take_away'

describe Order do

  default_menu = {
    'Nutella on rice cakes and banana on top' => 3,
    'Scrambled eggs' => 4.99,
    'Roasted aubergine & tomato curry' => 5.60,
    'Jacket Potato with whipped feta' => 8.25,
    'Mushroom, ricotta & rocket tart' => 9.20,
    'Cod with beans & artichokes' => 11.40,
  }

  # let(:confirmation) {double("Thank you! Your order was placed and will be delivered before 18:52")}

  describe '#check total amount' do
    it 'should check if current amount in selection matches with sum_amount' do
      take_away = TakeAway.new
      take_away.select("Scrambled eggs", 2)
      subject = Order.new(take_away)
      expect(subject.sum_amount).to eq take_away.current_amount
    end
  end

  describe '#place order' do
    xit 'should raise an error if the sum is not correct' do

    end

    xit 'should send a confirmation message if correct order' do
      expect(subject.place_order).to eq confirmation
    end
  end
end