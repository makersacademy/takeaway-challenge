require_relative '../lib/order.rb'

describe Order do

  let(:fake_menu_item) { double :fake_menu_item }

  describe '#order_food' do
    it "allows the customer to order food" do
      subject.selection(fake_menu_item)
      expect(subject.basket).to match_array(fake_menu_item)
    end
  end
end
