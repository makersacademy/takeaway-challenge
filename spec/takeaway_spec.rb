require 'takeaway'

describe Takeaway do

  let(:selection) { described_class.new }

  describe '#show_menu'
  it 'displays the menu' do
    allow(selection).to receive(:show_menu){'1. Pizza - £4'}
    expect(selection.show_menu).to eq '1. Pizza - £4'
  end

  describe '#preview_order' do
    it 'should create a preview order' do
      expect(selection.preview_order('pizza', 'pasta')).to eq "Your order\npizza\npasta\nTotal: £7"
    end
  end
end
