require 'order'

describe Order do

  default_menu = {
    'Nutella on rice cakes and banana on top' => 3,
    'Scrambled eggs' => 4.99,
    'Roasted aubergine & tomato curry' => 5.60,
    'Jacket Potato with whipped feta' => 8.25,
    'Mushroom, ricotta & rocket tart' => 9.20,
    'Cod with beans & artichokes' => 11.40,
  }

  let(:confirmation) {double("Thank you! Your order was placed and will be delivered before 18:52")}
  let(:selection) {double({ 'Scrambled eggs' => 2 })}

  subject { Order.new(selection) }

  describe '#check total amount' do
    it 'should check if the total amount equals the current menu selection amount' do
      expect(subject.sum_amount).to eq 9.98
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