require 'takeaway'

describe Takeaway do 
  context 'On initializing Takeaway' do
    it { is_expected.to respond_to(:menu) }
    it { is_expected.to respond_to(:basket) }
    it { is_expected.to respond_to(:grand_total) }
  end
  
  describe 'read_menu' do
    it 'Shows customer a list of dishes and prices' do 
      expect(subject.read_menu).to include(:"chicken balls" => 2.0, :"chow mein" => 1.99, :"duck pancakes" => 1.0)
    end
  end

  describe 'order' do 
    it 'Updates the basket with an order item' do
      subject.order("chow mein", 2)
        expect(subject.basket.count).to eq(1)
    end
    
    it 'Provides a confirmation message of basket entry' do 
      expect(subject.order("chow mein", 2)).to eq("You have added chow mein x 2")
    end
  end 
  
  describe 'grand_total' do
    it 'Provides the total cost of an order' do
      dinnerFor3 = subject
      dinnerFor3.order("chow mein", 2)
      dinnerFor3.order("chicken balls")
        expect(dinnerFor3.grand_total).to eq(5.98)
    end
  end
    
  describe 'reconcile' do
    context 'Checks the sum of items in basket match the grand_total' do
    
      it 'Sends a confirmation message if correct and calls time method' do 
        subject.order("chow mein", 2)
          expect(subject.reconcile).to eq("Thank you! Your order was placed and will be delivered before #{subject.time}")
      end
    end
  end 
end 