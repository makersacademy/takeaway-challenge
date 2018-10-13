require 'order'

describe Order do
  default_menu = { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3 }

  let(:menu) { double :Menu, :menu_items => default_menu }
  subject(:order) { described_class.new(menu) }

  describe '#add_items' do

    it 'can add a single item' do
      order.add_items('pizza', 1)
      expect(order.basket).to eq({ 'pizza' => 1 })
    end

    it 'Can add a single item with a quantity greater than 1' do
      order.add_items('pizza', 2)
      expect(order.basket).to eq({ 'pizza' => 2 })
    end

    it 'Can add multiple items' do
      order.add_items('pizza', 1)
      order.add_items('burger', 1)
      expect(order.basket).to eq({ 'pizza' => 1, 'burger' => 1 })
    end

    it 'Can add multiple items of variable quantities' do
      order.add_items('pizza', 1)
      order.add_items('burger', 2)
      expect(order.basket).to eq({ 'pizza' => 1, 'burger' => 2 })
    end

    it 'The same item can be added multiple times' do
      order.add_items('burger', 1)
      order.add_items('pizza', 1)
      order.add_items('burger', 1)
      expect(order.basket).to eq({ 'burger' => 2, 'pizza' => 1 })
    end

  end

  describe '#order_summary' do

    it 'single item' do
      order.add_items('pizza', 1)
      expect(order.order_summary).to eq('pizza x1 = £6.99')
    end

    it 'single item with quantity greater than 1' do
      order.add_items('pizza', 2)
      expect(order.order_summary).to eq('pizza x2 = £13.98')
    end

    it 'multiple items of quantitity of 1' do
      order.add_items('pizza', 1)
      order.add_items('burger', 1)
      expect(order.order_summary).to eq('pizza x1 = £6.99, burger x1 = £3')
    end

    it 'multiple items of multiple quantities' do
      order.add_items('pizza', 1)
      order.add_items('burger', 2)
      expect(order.order_summary).to eq('pizza x1 = £6.99, burger x2 = £6')
    end

  end

  describe '#total' do
    it 'shows total for items in basket' do
      order.add_items('pizza', 1)
      order.add_items('burger', 2)
      expect(order.total).to eq 12.99
    end
  end

end
