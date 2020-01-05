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
      expect{ subject.select(1, 1) }.to change { subject.sum }
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
      expect(subject.total).to be_a(String)
    end
  end

  describe "#checkout" do
    it 'places order' do
      subject.select(1, 1)
      expect(subject.checkout(4.99)).to be_a(String)
    end
  end

  describe "#send_text" do
    it 'sends a payment confirmation text message' do
      expect(subject).to receive(:send_text)
      subject.send_text
    end
  end

end
