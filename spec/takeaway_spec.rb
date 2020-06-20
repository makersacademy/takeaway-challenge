require 'takeaway'

describe Takeaway do
  
  describe '#initialize' do
    it "should initialize with an instance of menu that can be called with '.menu'" do
      expect(subject.menu).to be_instance_of(Menu)
    end
  end
  
  describe '#read_menu' do
    it 'should return the menu' do
      expect(subject.read_menu.to_s).to eq('[{:item=>"food1", :price=>"1.00"}, {:item=>"food2", :price=>"2.00"}]')
    end
  end

  describe '#add_to_order' do
    it 'should add food item to order' do
      subject.add_to_order('food1')
      expect(subject.show_order.to_s).to eq('[{:item=>"food1", :qty=>1, :price=>1}]')
    end
  end
  
  describe '#order_total' do
    it 'should return the correct amount' do
      subject.add_to_order('food1', 1)
      subject.add_to_order('food2', 2)
      expect(subject.order_total).to eq("Order total is: £5")
    end
  end
  
  describe '#send_text' do
    before do
      allow(subject).to receive(:send_text)
    end
  
    it 'sends a payment confirmation text message' do
      expect(subject).to receive(:send_text).with("Thank you! Your order was placed and will be delivered before 18:52")
      subject.finalise_order
    end
  end
  
end
