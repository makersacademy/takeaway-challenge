require 'takeaway' 

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:item){double :item}
  #before do
 #end
  
  it "responds to the show_menu method" do
    expect(subject).to respond_to(:show_menu)     #.with (1).argument
    
  end
  
  it "responds to the order method" do
    expect(subject).to respond_to(:order).with(1).argument
  end
  
  it "adds an item to the orders array" do
    item = "spring roll"
    #allow{{takeaway.order(item)}.to be true
    #allow(takeaway).to receive(takeaway.order(:item)) { true }
    expect{takeaway.order(item)}.to change{takeaway.orders.length}.by(+1)
    puts takeaway.orders.length
  end
  
  
end