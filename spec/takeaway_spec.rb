require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, selection: selection) }

  let(:menu) { double :menu, print: printed_menu }
<<<<<<< HEAD
  let(:selection) { instance_double("Selection", total: 50.50) }
=======
  let(:selection) { double(:selection) }
>>>>>>> 3e3a9aa6a5ad2fbd5599a0587e75847e5c2151e5
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

<<<<<<< HEAD
  it 'returns the total cost of the order' do
    allow(selection).to receive(:add)
    total = takeaway.select_dishes(dishes)
    expect(total).to eq(50.50) 
  end

=======
>>>>>>> 3e3a9aa6a5ad2fbd5599a0587e75847e5c2151e5
end
