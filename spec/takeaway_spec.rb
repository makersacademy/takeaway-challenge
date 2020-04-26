require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new }
  let(:order) { double(:order => "Tomato Salad") }
  let(:menu_class) { double(:menu_class) }
  let(:kitchen_class) { double(:kitchen_class) }

  context 'instance variables' do
    it 'Menu class' do
      allow(takeaway).to receive(:menu) { menu_class }
      expect(takeaway.menu).to eq menu_class
    end

    it 'Kitchen class' do
      allow(takeaway).to receive(:Kitchen) { kitchen_class }
      expect(takeaway.Kitchen).to eq kitchen_class
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
      expect(takeaway).to receive(:order)
      takeaway.order("Tomato Salad")
    end

    it 'more than one order' do
      allow(takeaway).to receive(:order).and_return(["Lamb Burger", "Spicy Meatballs"])
      expect(takeaway).to receive(:order)
      takeaway.order(["Lamb Burger", "Spicy Meatballs"])
    end

    context '#checkout' do
      it 'should give order and total' do
        
      end

    end

  end


end