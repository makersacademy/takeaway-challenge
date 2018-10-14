require 'order'

describe Order do
  default_menu = { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3 }

  let(:menu) { double :Menu, :menu_items => default_menu, :on_menu? => true }
  subject(:order) { described_class.new(menu) }

  describe '#add_items' do
    context 'When item is on the menu' do
      it 'Can add a single item' do
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

    context 'when item is not on the menu' do
      let(:menu) { double :Menu, :on_menu? => false }
      it 'Raises an error' do
        expect { order.add_items('curry', 1) }.to raise_error('Invalid dish. Only items on the menu can be added to your order.')
      end
    end
  end

  describe '#order_summary' do

    it 'Shows summary for single item' do
      order.add_items('pizza', 1)
      expect(order.order_summary).to eq('pizza x1 = £6.99')
    end

    it 'Shows summary for single item with quantity greater than 1' do
      order.add_items('pizza', 2)
      expect(order.order_summary).to eq('pizza x2 = £13.98')
    end

    it 'Shows summary for multiple items with a quantity of 1' do
      order.add_items('pizza', 1)
      order.add_items('burger', 1)
      expect(order.order_summary).to eq('pizza x1 = £6.99, burger x1 = £3')
    end

    it 'Shows summary for multiple items of multiple quantities' do
      order.add_items('pizza', 1)
      order.add_items('burger', 2)
      expect(order.order_summary).to eq('pizza x1 = £6.99, burger x2 = £6')
    end

    it 'Raises error if nothing has been ordered' do
      expect { order.order_summary }.to raise_error('You have not ordered any dishes.')
    end

  end

  describe '#total' do
    it 'Shows total for items ordered' do
      order.add_items('pizza', 1)
      order.add_items('burger', 2)
      expect(order.total).to eq '£12.99'
    end
  end

  describe '#checkout' do
    it 'Raises error if amount inputted does not match order total' do
      expect { order.checkout(0) }.to raise_error('You have not ordered any dishes.')
    end

    it 'Raises error if amount inputted does not match order total' do
      order.add_items('burger', 2)
      expect { order.checkout(13.99) }.to raise_error('Incorrect amount. You need to enter the correct order total to checkout.')
    end
  end



end
