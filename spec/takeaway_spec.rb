require 'takeaway'

describe TakeAway do
  default_menu = { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3.00 }

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :Menu, :menu_items => default_menu }

  describe '#show_menu' do

    it 'responds' do
      expect(takeaway).to respond_to(:show_menu)
    end

    it 'receivies menu_items' do
      expect(menu).to receive(:menu_items)
      takeaway.show_menu
    end

    it 'shows the menu' do
      expect(takeaway.show_menu).to eq(default_menu)
    end

  end

  describe '#add_to_order' do

    it 'accpets 1 argument' do
      expect(takeaway).to respond_to(:add_to_order).with(1).arguments
    end

    it 'accepts 2 arguments' do
      expect(takeaway).to respond_to(:add_to_order).with(1).arguments
    end

  end

  describe '#order_summary' do


  end

end
