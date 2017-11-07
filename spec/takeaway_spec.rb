require 'takeaway'

describe Takeaway do
  let(:dish) { double(:dish, name: :americano, price: 2.5) }
  let(:menu1) { menu1 = double(:menu1) }
  let(:order1) { order1 = double(:order1, basket: {}, total: 30) }
  let(:menu_cl) { double(:Menu, new: menu1) }
  let(:order_cl) { double(:Order, new: order1) }

  describe 'attributes' do
    it 'has a total equal to 0' do
      expect(subject.total_orders).to eq([])
    end

    it 'has an instance of menu' do
      subject = Takeaway.new(menu_class: menu_cl)
      expect(subject.menu).to eq menu1
    end

    it 'has instance of order' do
      subject = Takeaway.new(order_class: order_cl)
      expect(subject.order).to eq order1
    end
  end

  context 'when sum paid does not equal the total' do

    it 'raises an error' do
      allow(order1).to receive(:basket).and_return({ dish => 5 })
      takeaway1 = Takeaway.new(order_class: order_cl, menu_class: menu_cl)
      expect { takeaway1.complete(10) }.to raise_error RuntimeError
    end
  end

end
