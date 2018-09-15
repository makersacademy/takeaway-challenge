require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  subject(:takeaway) { described_class.new(menu, order) }
 
  it 'contains a @menu that is an instance of Menu' do
    ta = described_class.new()
    expect(ta.menu).to be_an_instance_of(Menu)
  end

  describe '#show_menu' do
    it 'shows menu using menu.show_menu' do
      allow(menu).to receive(:show_menu).and_return("SHOULD PRINT THIS")
      expect(takeaway.read_menu).to eq('SHOULD PRINT THIS')
    end
  end

  describe '#order_item' do

  end

  describe '#show_basket' do
    
  end

end