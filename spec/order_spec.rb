require 'order'

describe Order do

  let(:new_order) { described_class.new }

  describe "#order_confirmation" do
    it 'should send an order confirmation message' do
      # delivery_time = double('delivery_time')
      # allow(:order_confirmation).to receive(:delivery_time).and_return("20:30")
      # expect { new_order.order_confirmation }.to output("Thanks for your order! It will be delivered in 45 minutes at 20:30.").to_stdout
    end
  end
end
