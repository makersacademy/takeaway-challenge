require_relative '../lib/order.rb'

describe Order do

  describe '#order_food' do
    it "allows the customer to order food" do
      expect(subject.selection[1][1]).to change { subject.basket }.to([{"Butternut Squash Wrap": 3.95}])
    end

  end

end
