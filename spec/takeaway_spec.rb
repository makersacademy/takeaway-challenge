require 'takeaway'
describe Takeaway do
  describe '#menu' do
    it 'shows you a menu with price' do
      expect(subject.menu).to eq Menu.new.menu	
    end
  end
  describe '#final_order' do
    it 'shows you the dish you order and its quantity' do
      expect(subject.final_order).to be_an_instance_of(Array)
    end
  end
  describe '#total' do  
    it 'shows you the total of your order' do
      expect(subject.total).to be_an_instance_of(Integer)
    end
  end
  describe '#order(dish, quantity)' do
    it 'raises an error if the dish is not on the menu' do
      fake_order = double
      message = "We do not have that dish here"
      allow(fake_order).to receive(:order).and_raise message
    end 
    it 'returns total each time' do
      dish = double(:seafood_ramen)
      quantity = double(1)
      expect(subject.order(:seafood_ramen, 1)).to be_an_instance_of(Float)
    end 
  end  

  describe '#sum_correct?' do
    it 'returns true or false' do
      expect(subject.sum_correct?).to be_truthy
    end
  end

  describe '#confirmation' do 
    it 'sends an SMS message of confirmation' do
      receiver = double("receiver")
      receiver.stub(:confirmation).and_return(:send_text)
      receiver.confirmation.should eq(:send_text)
    end
  
    it 'raises an error if the sum and the quantity are different' do
      dbl = double
      message = "There was an error in your order"
      allow(dbl).to receive(:confirmation).and_raise message
    end
  end  
end
