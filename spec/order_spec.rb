require 'order'

describe Order do

  let(:new_order) { described_class.new }

  describe "#order_confirmation" do
    it 'should send an order confirmation message' do
      allow(new_order).to receive(:time).and_return('20:30')
      expect { new_order.order_confirmation }.to output("Thanks for your order! It will be delivered in 45 minutes at #{@time.strftime("%H:%M")}.").to_stdout
    end
  end
end
