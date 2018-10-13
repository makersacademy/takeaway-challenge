require 'takeaway'

describe TakeAway do
  default_menu = { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3 }

  let(:menu) { double :Menu, :menu_items => default_menu }
  let(:order) { double :Order, :total => 13.98 }

  subject(:takeaway) { described_class.new(menu, order) }

  before do
    allow(order).to receive(:add_items)
  end

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

    it 'accepts 1 argument' do
      expect(takeaway).to respond_to(:add_to_order).with(1).arguments
    end

    it 'accepts 2 arguments' do
      expect(takeaway).to respond_to(:add_to_order).with(2).arguments
    end

    it 'sends message to order' do

      expect(order).to receive(:add_items)
      takeaway.add_to_order('Pizza')
    end

  end

  describe '#order_summary' do
    it 'receivies order summary' do
      expect(order).to receive(:order_summary)
      takeaway.order_summary
    end
  end

  describe '#total' do
    it 'calls total on Order' do
      expect(order).to receive(:total)
      takeaway.total
    end

    it 'formatts total with currency' do
      expect(takeaway.total).to eq '£13.98'
    end
  end

  describe '#checkout' do
    it 'calls total on Order' do
      expect(order).to receive(:total)
      takeaway.checkout(13.98)
    end

    it 'Raises error if incorrect amount inputted' do
      expect { takeaway.checkout(13.99) }.to raise_error('Incorrect amount. You need to enter the correct order total to checkout.')
    end
  end

end
