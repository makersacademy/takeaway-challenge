require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :Menu, :menu_items => { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3.00 } }

  describe '#show_menu' do

    it 'responds' do
      expect(takeaway).to respond_to(:show_menu)
    end

    it 'receivies menu_items' do
      expect(menu).to receive(:menu_items)
      takeaway.show_menu
    end

    it 'shows the menu' do
      expect(takeaway.show_menu).to eq({ 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3.00 })

    end

  end

end
