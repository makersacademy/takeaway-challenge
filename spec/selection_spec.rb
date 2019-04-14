require 'selection'

describe Selection do
  subject(:selection) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }
  let(:dishes) {{ 
    pizza: 2, 
    pasta: 1, 
    risotto: 3
  }}
  
  before do
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
    allow(menu).to receive(:has_dish?).with(:pasta).and_return(true)
    allow(menu).to receive(:has_dish?).with(:risotto).and_return(true)

  end
  
  it 'selects several dishes from the menu' do
    selection.add(:pizza, 2)
    selection.add(:pasta, 1)
    selection.add(:risotto, 3)
    expect(selection.dishes).to eq(dishes)
  end

  it 'does not allow dishes to be added if not on the menu' do
    allow(menu).to receive(:has_dish?).with(:brownies).and_return(false)
    expect{ selection.add(:brownies, 10) }.to raise_error NoItemError, "Brownies are not on the menu, you pig."
  end
  end 