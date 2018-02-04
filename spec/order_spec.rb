require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#add' do
    it 'stores selected items in the basket' do
      expect { order.add("Buckwheat Shamalam") }.to change { order.basket }.to(["Buckwheat Shamalam"])
    end
  end

  describe '#price' do
    it 'returns the total payment due' do
      expect(order.price).to eq(order.price)
    end
  end
end

  # describe '#confirmation' do
  #   subject(:order) { described_class.new(text) }
  #
  #   describe '#confirmation'
  #   before do
  #     allow(text).to receive(:send_sms)
  #   end

    # it 'sends a confirmation text when an order is placed' do
    #   expect(text).to receive(:send_sms).with("This is the voice of your conscience speaking - you eat a lot!")
    # end
