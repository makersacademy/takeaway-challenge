require 'takeaway'
require 'menu'
require 'order'
require 'sms'

describe Takeaway do 

  let(:menu_class) { double(:menu_class, new: menu) }
  let(:menu) { double(:menu) }

# need to double order
  subject(:takeaway) { described_class.new(order: order, sms: sms, config: {}) }

  let(:order) { double(:order, total: 21) }
  let(:dishes) { { chicken: 1, chinese: 2 } }

  let(:sms) { instance_double("sms", deliver: nil) }

# is this dish the dish above?
  before do
    allow(menu_class).to receive(:new) { [{ name: 'chinese', price: 8 }, { name: 'fishandchips', price: 7 }, { name: 'chicken', price: 5 }, { name: 'beef', price: 6 }] }
    allow(order).to receive(:add) 
  end 

  describe '#check_menu' do 
    it 'displays list of dishes and prices' do 
      
      menu = menu_class.new
      # how to use the double dish above, instead of creating a new double here. (it didnt work)
      p menu
      expect(menu).to receive(:display_list) 
      # couldnt put dish_class.new here
      subject.check_menu(menu)
   
      # ?? return vs puts
    end 
  end 

  describe '#place_order' do 
    it 'adds dishes to order' do 
      allow(order).to receive(:total)
      takeaway.place_order(dishes)
      expect(takeaway.order).to eq dishes
    end
  
    it 'knows order total' do
      allow(order).to receive(:add)
      allow(order).to receive(:total).and_return(21)
      expect(takeaway.total(order)).to eq 21
    end 
  end 

  it "sends an sms when the order has been placed" do 
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end 

end
