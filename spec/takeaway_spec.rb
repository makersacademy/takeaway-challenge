require 'takeaway' 

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
    
    it "should produce the correct total" do
       item1 = "spring roll"
       item2 = "peking duck"
       takeaway.order(item1, 3)    #0.99 * 3 = 2.97
       takeaway.order(item2, 4)    #7.99 * 4 = 31.96, Total = £34.93
       expect{(takeaway.total).to output('Total: £34.93').to_stdout }
       print takeaway.total
       
    end
    
  end
  
  
  
  
end