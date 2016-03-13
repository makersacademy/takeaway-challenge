require 'takeaway'
Dotenv.load

describe Takeaway do
  let(:menu) {double :menu}
  let(:dish) {double :dish}
  let(:order) {double :order}
  let(:order_klass) {double :order_klass, new: order}
  let(:messenger) {double :messenger}
  let(:messenger_klass) {double :messenger_klass, new: messenger}
  subject(:takeaway) { described_class.new menu, order_klass, messenger_klass}

  describe '#select_item' do
    it '> should send add item method to order class if it is on the menu' do
      allow(takeaway).to receive(:on_menu?).and_return(true)
      expect(order).to receive(:add_item).with(dish)
      takeaway.select_item(dish)
    end

    it '> should add more than one of the item if passed second argument' do
      allow(takeaway).to receive(:on_menu?).and_return(true)
      expect(order).to receive(:add_item).with(dish).twice
      takeaway.select_item(dish, 2)
    end

    it '> should raise error if item not on menu' do
      message = "#{dish} is not on the menu."
      allow(takeaway).to receive(:on_menu?).and_return(false)
      allow(order).to receive(:add_item).with(dish)
      expect{takeaway.select_item(dish)}.to raise_error message
    end

  end

  describe '#confirm_order' do
    before do
      allow(order).to receive(:add_item).with(dish)
      allow(order).to receive(:calc_total).and_return(5)
      allow(takeaway).to receive(:on_menu?).and_return(true)
    end

    it '> should send text message if argument matches order total' do
      takeaway.select_item(dish)
      text_message = "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}."
      expect(messenger).to receive(:send).with(text_message)
      takeaway.confirm_order(5)
    end

    it '> should raise error if argument does not match order total' do
      message = "Does not match total of #{order.calc_total}"
      takeaway.select_item(dish)
      expect{takeaway.confirm_order(6)}.to raise_error message
    end
  end

end
