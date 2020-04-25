require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new }
  let(:order) { double(:order => "Tomato Salad") }
  
  describe '#menu' do
    it 'should list dishes' do
      expect{ takeaway.menu_list }.to output.to_stdout
    end

    it 'order total to be empty at start' do
      expect(takeaway.order_total.empty?).to be true
    end

    it 'should be able to place order' do
      takeaway.order order.order
      expect(takeaway.order_total.shift).to eq "Tomato Salad"
    end

    it 'should be able to order more than one order' do
      test_order = ["Lamb Burger", "Spicy Meatballs"]
      takeaway.order "Lamb Burger"
      takeaway.order "Spicy Meatballs"
      expect(takeaway.order_total).to eq test_order
    end

  end

  describe '#order' do
    
  end

  describe '#checkout' do
    
  end

end