require 'takeaway'

describe TakeAway do
    
  describe '#read_menu' do
    it 'gives a list of dishes' do
      expect(subject.read_menu).not_to be_empty
    end
  end

  describe '#select' do
    it 'gets item number from customer' do
      expect{ subject.select(1) }.to change { subject.basket }
    end
  end

end
