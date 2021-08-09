require 'happiness_delivered'
require 'sandcream'

describe HappinessDelivered do
  let(:sandcream) { Sandcream.new }
  
  context 'respond to methods' do
    it { is_expected.to respond_to(:interactive_menu) }
    it { is_expected.to respond_to(:interface) }
    it { is_expected.to respond_to(:print_menu) }
    it { is_expected.to respond_to(:select_order) }
    it { is_expected.to respond_to(:review_order) }
    it { is_expected.to respond_to(:complete_order) }
  # it { is_expected.to respond_to(:print_menu_options).with(1).argument }
  end

  describe '#initialize' do
    it 'menu is a Sandcream object' do
      expect(subject.menu).to be_a Sandcream
    end

    it 'basket is empty' do
      expect(subject.basket).to be_empty
    end

    it 'order_total is empty' do
      expect(subject.order_total).to be_empty
    end
  end

  describe '#interactive_menu' do
    
  end

  describe '#interface' do
    
    it 'does stuff' do
      expect(subject.interface()).to respond_to(:select_order)
    end
  end

  describe '#print_menu' do
    
  end
  
  # describe '#select_order' do
  #   before(:each) { $stdin = '1'}  

  #   it 'should add order to basket' do 
  #     # allow($stdin).to receive(:gets).and_return('2')
  #     select_order = $stdin.gets
  #     expect(subject.basket).to eq(2)
  #   end
  # end

  describe '#review_order' do
    let(:delivero) { HappinessDelivered.new([{ sando: 
      '2. Clubster Cluck - Grilled Chicken', price: 9.50 }, { sando: 
      '5. Big City Life - Smoked Salmon & Cream Cheese', price: 10.50 },
      { icecream: '10. Strawberry Fields Forever - Strawberry & Cream', 
      price: 5.50 }])
    }

    it 'returns sum of order total' do
      delivero.review_order
      # p 
      expect(delivero.order_total.sum).to eq(25.50)
    end
  end

  describe '#complete_order' do
    it 'sends sms to customer' do
      expect(subject.complete_order).to eq 'magic message'
    end
  end
end
