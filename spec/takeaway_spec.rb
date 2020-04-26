require 'takeaway' 

describe TakeAway do

  subject(:takeaway) { described_class.new }
  let(:order) { double(:order => "Tomato Salad") }
  let(:menu_class) { double(:menu_class) }
  let(:kitchen_class) { double(:kitchen_class) }
  let(:text_class) { double(:text_class) }
  let(:phone) { double(:phone) }

  context 'instance variables' do
    it 'Menu class' do
      allow(takeaway).to receive(:menu) { menu_class }
      expect(takeaway.menu).to eq menu_class
    end

    it 'Kitchen class' do
      allow(takeaway).to receive(:kitchen) { kitchen_class }
      expect(takeaway.kitchen).to eq kitchen_class
    end

    it 'Text class' do
      allow(takeaway).to receive(:text) { text_class }
      expect(takeaway.text).to eq text_class
    end

  end

  context '#menu_list' do
    it 'should list dishes' do
      expect{ takeaway.menu_list }.to output.to_stdout
    end
  end

  context '#order' do
    it 'able to place once' do
      allow(takeaway).to receive(:order).and_return("Tomato Salad")
      expect(takeaway.order).to eq "Tomato Salad"
    end

    it 'more than one order' do
      allow(takeaway).to receive(:order).and_return(["Lamb Burger", "Spicy Meatballs"])
      expect(takeaway.order).to eq ["Lamb Burger", "Spicy Meatballs"]
    end

    context '#checkout' do
      it 'should give order and total' do
        allow(takeaway).to receive(:empty?).and_return false
        allow(takeaway.kitchen).to receive(:order_total).and_return order.order
        expect(takeaway.checkout).to eq order.order
      end

      it 'should raise error if no orders' do
        expect{ takeaway.checkout }.to raise_error "Can not process the order: no items selected"
      end
    end

    context '#confirm_order' do
      it 'should receive text' do
        expect{ takeaway.confirm_order(phone) }.to output.to_stdout
      end
    end

  end

end
