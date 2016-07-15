require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double :menu }
  
  it 'should print the menu with prices' do
    expect(takeaway.print_menu).to eq ("Margherita: £6.50")
  end
end
