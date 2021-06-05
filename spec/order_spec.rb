require 'order'

describe Order do
  
  let(:basket) { { fish: 5, chips: 2 } }
  let(:menu_double) { double show_menu: { fish: 6, chips: 2, sausage: 2.50, mushy_peas: 2 } } 
  let(:menu) { { fish: 6, chips: 2, sausage: 2.50, mushy_peas: 2 } }
  let(:sms_double) { double send_sms: 'Thank you for your order' }

  describe '#initialize' do
    subject(:order) { described_class.new(menu_double) }
    it 'is initialized with an empty basket' do
      expect(order.basket).to be_empty
    end
    it 'has an empty cost at the start' do
      expect(order.total_cost).to eq 0
    end
  end

  describe '#read_menu' do 
    subject(:order) { described_class.new(menu_double) }
    it 'reads the menu' do
      expect(order.read_menu).to eq menu_double.show_menu
    end 
  end

  describe '#verify' do
    it ' returns the total cost of the basket' do
      subject.add_item(:fish, 2)
      expect(subject.verify).to eq "Your total is £12"
    end
  end
       
  context 'when an order has already been added to the basket' do
    subject(:order) { described_class.new(menu_double, sms_double) }
    before(:each) { order.add_item(:fish, 5) }
    before(:each) { order.add_item(:chips, 2) }
    it 'displays the basket' do
      expect(order.show_basket).to include basket
    end
    it 'tells sms to send a message' do
      expect(order.confirm).to eq 'Thank you for your order'
    end
  end
end
