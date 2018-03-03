require_relative '../lib/order.rb'

describe Order do

  let(:fake_menu_item) { double :fake_menu_item }

  describe '#order_food' do
    it "allows the customer to order food" do
      expect(subject.selection(fake_menu_item)).to change { basket }.to(fake_menu_item)
    end

  end

end
