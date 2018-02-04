require 'order'
require 'take_away'

describe Order do

  let(:take_away) { TakeAway.new }

  describe '#place order' do
    it 'should raise an error if the sum is not correct' do
      amount = 10

      take_away.select("Scrambled eggs", 2)
      subject = Order.new(take_away)

      expect{subject.place_order(take_away.selection, amount)}.to raise_error("Wrong amount for your order")
    end

    it 'should send a confirmation sms if correct order amount' do
      take_away.select("Scrambled eggs", 2)
      subject = Order.new(take_away)

      allow(subject).to receive(:send_sms)
      expect(subject).to receive(:send_sms).with("Thank you! Your order was placed and will be delivered before 18:52")

      subject.place_order(take_away.selection, subject.total_amount)
    end
  end
end
