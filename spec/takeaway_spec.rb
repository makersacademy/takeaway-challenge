require 'order'
require 'takeaway'
describe Takeaway do
  describe '#read' do
    it 'has method' do
      is_expected.to respond_to(:read)
    end

    it'return default menu list' do
      output = subject.menu_list.each { |item, price| "#{item} : #{price}" }
      expect(subject.read).to eq output
    end

    it'return new menu list' do
      list = { "Spring Roll" => 0.99, "Fried Prawn" => 2.99 }
      takeaway = Takeaway.new(list)
      output = takeaway.menu_list.each { |item, price| "#{item} : #{price}" }
      expect(takeaway.read).to eq output
    end
  end

  describe '#create_order' do
    it 'return instance of Order' do
      expect(subject.create_order).to be_an_instance_of(Order)
    end
  end

  describe '#add_to_order' do
    context 'on menu' do
      it 'is method and take 1 arguments' do
        is_expected.to respond_to(:add_to_order).with(1).argument
      end
      it 'is method and take 2 arguments' do
        is_expected.to respond_to(:add_to_order).with(2).argument
      end
    end
    context 'qty negative' do
      it 'raise error on qty of - 5' do
        err_msg = "Qty cannot be negative"
        item = 'Fiorentina Pizza'
        qty = -5
        subject.create_order
        expect { subject.add_to_order(item, qty) }.to raise_error(err_msg)
      end
    end
    context 'item not menu' do
      it 'output error if item not on menu' do
        item = 'bana'
        err_msg = "#{item} not on the menu"
        subject.create_order
        expect { subject.add_to_order(item) }.to raise_error(err_msg)
      end
    end
  end

  describe '#view_order' do
    context 'empty basket' do
      it ' return empty string' do
  # " qty  x item(price) = (qty*price)"
        subject.create_order
        expect(subject.view_order).to eq("Basket is empty")
      end
    end
    context 'items in basket' do
      it 'return qty item = total price for item and current total' do
        subject.create_order
        subject.add_to_order('Ruspante Pizza')
        subject.add_to_order('Fiorentina Pizza', 2)
        output = "1 x Ruspante Pizza = £11.2\n2 x Fiorentina Pizza = £26.9\nTotal : £38.1"
        expect(subject.view_order).to eq(output)
      end
    end
  end
end
