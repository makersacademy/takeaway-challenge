require 'takeaway'

describe TakeAway do
    
  describe '#read_menu' do
    it 'gives a list of dishes' do
      expect(subject.read_menu).not_to be_empty
    end
  end

  describe '#select' do
    it 'gets item number from customer' do
      expect{ subject.select(1, 1) }.to change { subject.basket }
    end

    it 'gets item number from customer' do
      expect{ subject.select(1, 1) }.to change { subject.total }
    end
  end

  describe "#basket_summary" do
    it 'lists items in basket, quantities, and total' do
      subject.select(1, 1)
      expect(subject.basket_summary).not_to be_empty
    end
  end

  describe "#total" do
    it 'calculates the total' do
      subject.select(1, 1)
      expect(subject.total).not_to eq 0
    end
  end

end
