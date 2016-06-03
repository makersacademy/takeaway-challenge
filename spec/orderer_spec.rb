require 'orderer'

describe Orderer do

  DISH1_NAME = 'Chicken Chow Mein'
  DISH1_PRICE = 5.4
  DISH2_NAME = 'Beef Chow Mein'
  DISH2_PRICE = 7.7
  subject(:subject){ described_class.new(restaurant.menu, messenger) }
  let(:restaurant) { double(:restaurant, menu: [dish1, dish2]) }
  let(:dish1) { double(:dish1, name: DISH1_NAME, price: DISH1_PRICE , to_s: DISH1_NAME) }
  let(:dish2) { double(:dish2, name: DISH2_NAME, price: DISH2_PRICE , to_s: DISH2_NAME) }
  
  let(:messenger) { double(:messenger, send: true) }
  
  describe '#show_all_dishes' do
    it 'returns a single string' do
      expect(subject.show_all_dishes).to be_a(String)
    end
    it 'inlcudes dish1' do
      expect(subject.show_all_dishes).to include(DISH1_NAME)
    end
  end

  describe '#order' do
    it 'changes orders' do
      test_var = rand(3..5)
      expect {subject.order(0, test_var) }.to change{ subject.order_total }.by(DISH1_PRICE* test_var)
    end
  end

  describe '#order_total' do
    it 'returns a Fixnum' do
      expect(subject.order_total).to be_a(Fixnum)    
    end
  end

  describe '#show_order' do
    it 'inlcudes dish1' do
      subject.order(0, 1) 
      expect(subject.show_order).to include(DISH1_NAME)
    end
  end

  describe '#confirm' do
    it 'sends message to messager' do
      expect( messenger ).to receive(:send)
      subject.confirm
    end
  end

end
