require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, selection: selection, sms: sms) }

  let(:menu) { double :menu, print: printed_menu }
  let(:selection) { instance_double("Selection", total: 50.50) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "Pizza: £10.50" }
  let(:dishes) {{
    pizza: 2, 
    pasta: 1, 
    risotto: 3
  }}

  before do 
    allow(selection).to receive(:add)
  end
  
  it 'shows a menu with a list of dishes and prices' do 
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'selects some number of several available dishes' do
    expect(selection).to receive(:add).at_least(:once)
    takeaway.select_dishes(dishes)
  end

  it 'returns the total cost of the order' do
    total = takeaway.select_dishes(dishes)
    expect(total).to eq(50.50) 
  end

  it 'sends an sms when the order has been placed' do
    expect(sms).to receive(:deliver)
    takeaway.select_dishes(dishes)
  end
end
