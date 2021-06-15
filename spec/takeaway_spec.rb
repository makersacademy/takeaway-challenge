require 'takeaway'

describe Takeaway do  
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms) }  #role of another object, Menu object

  let(:menu) { double(:menu, print_out: printed_menu) } # using a double to call out the menu object to call the print out method to 
  let(:order) { instance_double("Order", total: 16.00) }
  let(:sms)  { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "Fish: £5.00" }

  let(:dishes) { {fish: 2, beef: 1} }

  before do
    allow(order).to receive(:add)
  end

  it 'Prints menu to show the list of dishes and prices' do
    expect(subject.print_menu).to eq(printed_menu)
  end   

  it 'can order several number of food dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows the order total" do
   total = takeaway.place_order(dishes)
   expect(total).to eq(16.00)
  end

  it "sends an SMS when the order has been placed" do 
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end