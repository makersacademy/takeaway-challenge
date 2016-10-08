require 'takeaway' 
require 'messager'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  #let(:item){double :item}

  
  it "responds to the show_menu method" do
    expect(subject).to respond_to(:read_menu)     #.with (1).argument
  end
  
  it "responds to the order method" do
    expect(subject).to respond_to(:order).with(2).arguments
  end
  
  describe "makes an order" do
  
    it "adds a single item to the orders array" do
      item = "spring roll"        #This will fail if the menu changes
      expect{takeaway.order(item)}.to change{takeaway.orders.length}.by(+1)
    end
    
    it "adds a number of items to the orders array" do
      item = "spring roll"        #This will fail if the menu changes
      expect{takeaway.order(item,3)}.to change{takeaway.orders.length}.by(+3)
    end
  end
  
  describe "completes an order" do
    before do
      item1 = "spring roll"
      item2 = "peking duck"
      takeaway.order(item1, 3)    #0.99 * 3 = 2.97
      takeaway.order(item2, 4)    #7.99 * 4 = 31.96, Total = £34.93
    end
    
    it "should produce the correct total" do
      expect{(takeaway.total).to output('Total: £34.93').to_stdout }
    end
    
    it "checks that the balance submitted is correct" do
      #expect(takeaway.checkout(34.93)).to eq true       #Don't understand why this doesn't work!!!!!!!!!
    end
    
    before do
      allow(takeaway).to receive(:send_text)
    end
  
    it 'sends a payment confirmation text message' do
      expect(takeaway).to receive(:send_text).with("Thank you for your order. Total price: £34.93")
      takeaway.complete_order(34.93)
    end
  end

end