require 'order'
describe Order do

  context 'basket' do

  it 'should respond to an add method' do
    expect(subject).to respond_to(:add).with(2).argument
  end

  # it 'should add an item to the basket' do
  #   subject.add('Burger')
  #   expect(subject.basket).to contain_exactly('Burger')
  # end

  it 'should add a number of the same item to the basket' do
    subject.add('Burger', 3)
    expect(subject.basket).to contain_exactly('Burger', 'Burger', 'Burger')
  end

  it 'should not allow an item to be added which is not on the menu' do
    order = Order.new
      expect { order.add('Pizza', 3) }.to raise_error "Item unavailable"
    end

    it 'should display the items added to the basket along with a total number' do
      subject.add('Burger', 3)
      expect(subject.review).to eq ('Burger 3')
    end
  end

    describe 'cost' do
      it 'should total the cost of items in the basket' do
        order = Order.new
        order.add('Burger', 1)
        expect(order.total).to eq(10)
      end
    end

    describe 'confirm' do
      it 'should return a message stating that the order has been received and will arrive within an hour' do
      end
    end
end
