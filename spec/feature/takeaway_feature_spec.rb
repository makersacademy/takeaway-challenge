require 'takeaway'
require 'restaurant'


describe 'Takeaway Feature' do
  
  
  it 'Displays the list of restaurants and the chosen menu (1)' do
  
    takeaway = Takeaway.new
    allow(takeaway).to receive(:gets) {"1\n"}
    expect{ takeaway.menu }.to output("What cousine would you like?\n1 - Italian\n2 - Mexican\n3 - Indian\nPizza = £10.0\nPasta = £8.0\nMilanese = £14.0\n").to_stdout
    
  end
  
  context 'it is initialized with required objects by default' do

    it 'stores a restaurant' do
      takeaway = Takeaway.new
      expect(takeaway.restaurant).to be_a Restaurant
    end
    
    it 'stores an order log' do
      takeaway = Takeaway.new
      expect(takeaway.order_log).to be_an Order
    end 
    
    it 'stores a messager' do
      takeaway = Takeaway.new
      expect(takeaway.messager).to be_a Messager
    end
  end
  
  context 'it can be initialised with injected objects' do
    
    it 'can be initialised with a different restaurant' do
      takeaway = Takeaway.new "TEST FIRST"
      expect(takeaway.restaurant).to be_a String
    end
  end

end
