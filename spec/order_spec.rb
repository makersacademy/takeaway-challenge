require 'order'
require 'take_away'

describe Order do

  let(:take_away) { TakeAway.new }

  let(:confirmation) {("Thank you! Your order was placed and will be delivered before 18:52")}

  describe '#check total amount' do
    it 'should check if current amount in selection matches with sum_amount' do
      take_away.select("Scrambled eggs", 2)
      subject = Order.new(take_away)
      expect(subject.sum_amount).to eq take_away.current_amount
    end
  end

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