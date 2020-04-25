require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new }
  let(:order) { double(:order => "Tomato Salad") }
  
  context '#menu_list' do
    it 'should list dishes' do
      expect{ takeaway.menu_list }.to output.to_stdout
    end
  end

  context '#order' do
    it 'total to be empty at start' do
      expect(takeaway.order_total.empty?).to be true
    end

    it 'able to place' do
      takeaway.order order.order
      expect(takeaway.order_total.shift).to be order.order
    end

    it 'more than one order' do
      test_order = ["Lamb Burger", "Spicy Meatballs"]
      takeaway.order "Lamb Burger"
      takeaway.order "Spicy Meatballs"
      expect(takeaway.order_total).to eq test_order
    end

    context '#checkout' do
      it 'should give order and total' do
        
      end

    end

  end


end