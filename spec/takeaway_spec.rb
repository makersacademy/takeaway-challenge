require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, display: display_menu) }
  let(:display_menu) { 'Kebab: £10.50' }
  
  it 'allows to display a menu' do
    expect(takeaway.show).to eq(display_menu)
  end
end