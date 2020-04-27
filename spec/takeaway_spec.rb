require 'takeaway' 

describe TakeAway do

  subject(:takeaway) { described_class.new }
  let(:kitchen) { Kitchen.new }
  let(:order) { double(:order => "Tomato Salad") }
  let(:menu_class) { double(:menu_class) }
  let(:kitchen_class) { double(:kitchen_class) }
  let(:text_class) { double(:text_class) }
  let(:phone) { double(:phone) }

  context 'instance variables' do
    it 'Menu class' do
      expect(takeaway).to receive(:menu) { menu_class }
      takeaway.menu
    end

    it 'Kitchen class' do
      expect(takeaway).to receive(:kitchen) { kitchen_class }
      takeaway.kitchen
    end

    it 'Text class' do
      expect(takeaway).to receive(:text) { text_class }
      takeaway.text
    end

  end

  context '#menu_list' do
    it 'should list dishes' do
      expect { takeaway.menu_list }.to output.to_stdout
    end
  end

  context '#order' do
    it 'able to place once' do
      expect(kitchen).to receive(:order).and_return("Tomato Salad")
      kitchen.order order
    end

    it 'more than one order' do
      expect(kitchen).to receive(:order).and_return(["Lamb Burger", "Spicy Meatballs"])
      kitchen.order order
    end

    context '#checkout' do
      it 'should give order and total' do
        allow(takeaway).to receive(:empty?).and_return false
        expect(kitchen).to receive(:order_total).and_return order
        kitchen.order_total
      end

      it 'should raise error if no orders' do
        expect { takeaway.checkout }.to raise_error "Can not process the order: no items selected"
      end
    end

    context '#confirm_order' do
      it 'should receive text' do
        expect { takeaway.confirm_order(phone) }.to output.to_stdout
        takeaway.confirm_order phone
      end
    end

  end

end
