require 'takeaway' 

describe TakeAway do

  subject { described_class.new(menu, kitchen, text) }
  let(:menu) { double(:menu, print_menu: menu_list) }
  let(:menu_list) { double :menu_list }
  let(:kitchen) { double(:kitchen, order_cart: "Tomato Salad") }
  let(:text) { double(:text, sms: "Message") }
  let(:order) { double() }
  let(:phone) { double() }

  context 'instance variables' do
    it 'Menu class' do
      expect(subject).to receive(:menu) { menu }
      subject.menu
    end

    it 'Kitchen class' do
      expect(subject).to receive(:kitchen) { kitchen }
      subject.kitchen
    end

    it 'Text class' do
      expect(subject).to receive(:text) { text }
      subject.text
    end

  end

  context '#menu_list' do
    it 'should list dishes' do
      expect(menu).to receive(:print_menu)
      subject.menu_list
    end
  end

  context '#place_order' do
    it 'able to place once' do
      expect(kitchen).to receive(:order).with(order)
      subject.place_order order
    end

    it 'more than one order' do
      expect(kitchen).to receive(:order).with(order).twice
      subject.place_order order
      subject.place_order order
    end
  end

  context '#checkout' do
    it 'should give order and total' do
      expect(kitchen).to receive(:order_total).and_return order
      subject.checkout
    end

    it 'should raise error if no orders' do
      # allow(subject).to receive(:empty?).and_return(true)
      expect(kitchen).to receive(:order_cart) { [] }
      expect { subject.checkout }.to raise_error "Can not process the order: no items selected"
    end
  end

  context '#confirm_order' do
    it 'should receive text' do
      expect(text).to receive(:sms)
      subject.confirm_order phone
    end
  end
  
end
