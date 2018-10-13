require 'order'

describe Order do
  describe 'order status' do
    it 'new order - submitted = false' do
      expect(subject.submitted).to eq false
    end

    it 'ready order - submitted = true' do
      subject.add_dish("Small chips")
      expect(subject.submit).to eq true
    end
  end
  describe 'select dishes' do
    it 'records 1 dish selection' do
      subject.add_dish("Small chips")
      expect(subject.order_items[0][:dish]).to eq "Small chips"
    end

    it 'defaults quantity to 1' do
      subject.add_dish("Small chips")
      expect(subject.order_items[0][:quantity]).to eq 1
    end

    it 'records multiple dish selection 1 of each' do
      subject.add_dish("Small chips")
      subject.add_dish("Bread roll")
      expect(subject.order_items.length).to eq 2
    end

    it 'records multiples of item' do
      subject.add_dish("Small chips", 2)
      expect(subject.order_items[0][:quantity]).to eq 2
    end
  end

  describe 'basket' do
    it 'returns the cost of the order' do
      subject.add_dish("Small chips")
      subject.add_dish("Bread roll")
      expect(subject.total).to eq 2.55
    end

    it 'returns the cost of the order - multiple items' do
      subject.add_dish("Small chips", 2)
      subject.add_dish("Bread roll", 3)
      expect(subject.total).to eq 5.65
    end

    it 'returns the basket details' do
      subject.add_dish("Small chips", 2)
      subject.add_dish("Bread roll", 3)
      expect { subject.basket }.to output("Your basket:\n2 x Small chips\n3 x Bread roll\nOrder total: £5.65").to_stdout
      # expect { subject.menu }.to output("Large chips - £2.45\nSmall chips - £2.00\nCod - £4.85\nPlaice - £4.85\nHaddock - £4.85\nFishcake - £1.15\nBattered sausage - £1.15\nSpring roll - £2.50\nBread roll - £0.55\nCurry sauce - £1.30\nMushy peas - £1.30").to_stdout
    end
  end

  describe 'submit order' do
    # it 'create message object' do
    #   order = Order.new
    #   order.add_dish("Small chips", 2)
    #   order.submit
    #   # expect(submit_confirm).to exist
    #   expect(order.submit_confirm).to exist
    # end
  end
end
