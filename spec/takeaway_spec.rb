require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, selection: selection) }

  let(:menu) { double :menu, print: printed_menu }
  let(:selection) { double(:selection) }
  let(:printed_menu) { "Pizza: £10.50" }
  let(:dishes) {{
    pizza: 2, 
    pasta: 1, 
    risotto: 3
  }}
  
  it 'shows a menu with a list of dishes and prices' do 
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'selects some number of several available dishes' do
    expect(selection).to receive(:add).at_least(:once)
    takeaway.select_dishes(dishes)
  end

end
