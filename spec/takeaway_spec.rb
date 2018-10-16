require 'takeaway'

describe Takeaway do
  
  describe '#read_menu' do
    it 'should print menu' do
      expect(subject.read_menu).to eq({ "spring roll" => 0.99, "char sui bun" => 3.99, "fu-king fried rice" => 5.99 })
    end
  end
  
  describe '#order' do
    it 'order food to the basket' do
      subject.order("spring roll")
      expect(subject.basket).to include("spring roll")
      expect(subject.basket).to include("0.99")
    end
  end
  
  describe '#pay' do
    it 'pays the bill' do
      expect(subject.pay).to eq("Thank you! Your order was placed and will be delivered before 18:52")
    end
  end
  
end
