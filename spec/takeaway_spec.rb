require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu)}
  let(:menu) {double(:menu, :menu_list => {"chicken" => 15}) }

  before do
    allow(takeaway).to receive(:send_text)
  end

  describe '#list_menu' do

    it 'lists the current available menu items' do
      expect(takeaway.show_menu).to eq({"chicken" => 15})
    end
  end

  describe '#order' do
    it 'orders items from the menu' do
      order_result = "2 * chicken added to your order"
      expect(takeaway.order("chicken", 2)).to eq order_result
    end
  end

  describe '#basket' do
    it 'returns a string to the client showing their order' do
      takeaway.order("chicken", 2)
      test_order = "Your order summary is: \nchicken * 2 for $30,\nTotal = 30"
      expect(takeaway.basket).to eq test_order
    end
  end

  describe '#complete_order' do

    it 'sends an sms to confirm the order' do
      test_message = "Your order totalling $30 has been registered and will be delivered before 18:52"
      takeaway.order("chicken", 2)
      expect(takeaway).to receive(:send_text).with(test_message)
      takeaway.complete_order(30)
    end

    it 'raises an error if requested item is not on the menu' do
      error_message = "Item not on the menu: please choose again"
      expect{takeaway.order("lamb", 2)}. to raise_error(error_message)
    end

    it 'tests that the final amount matches tally of orders' do
      takeaway.order("chicken", 2)
      takeaway.order("chicken", 2)
      expect{takeaway.complete_order(20)}.to raise_error('Incorrect amount')
     end
  end
end