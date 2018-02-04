require 'order'
require 'take_away'

describe Order do

  let(:take_away) { TakeAway.new }

  let(:confirmation) {("Thank you! Your order was placed and will be delivered before 18:52")}

  describe '#place order' do
    it 'should raise an error if the sum is not correct' do
      amount = 10

      take_away.select("Scrambled eggs", 2)
      subject = Order.new(take_away)

      expect{subject.place_order(take_away.selection, amount)}.to raise_error("Wrong amount for your order")
    end

    it 'should send a confirmation message if correct order' do
      take_away.select("Scrambled eggs", 2)
      subject = Order.new(take_away)

      expect(subject.place_order(take_away.selection, subject.total_amount)).to eq confirmation
    end
  end
end
