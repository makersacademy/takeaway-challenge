require 'order'

describe Order do
  describe 'order status' do
    it 'new order - submitted = false' do
      expect(subject.submitted).to eq false
    end

    it 'ready order - submitted = true' do
      subject.select_dish("Small chips")
      expect(subject.submit).to eq true
    end
  end
  describe 'select dishes' do
    it 'records 1 dish selection' do
      subject.select_dish("Small chips")
      expect(subject.order_items[0][:dish]).to eq "Small chips"
    end

    it 'defaults quantity to 1' do
      subject.select_dish("Small chips")
      expect(subject.order_items[0][:quantity]).to eq 1
    end

    it 'records multiple dish selection 1 of each' do
      subject.select_dish("Small chips")
      subject.select_dish("Bread roll")
      expect(subject.order_items.length).to eq 2
    end

    it 'records multiples of item' do
      subject.select_dish("Small chips", 2)
      expect(subject.order_items[0][:quantity]).to eq 2
    end
  end

  describe 'calculate price' do
    it 'returns the cost of the order' do
      subject.select_dish("Small chips")
      subject.select_dish("Bread roll")
      expect(subject.total).to eq 2.55
    end

    it 'returns the cost of the order - multiple items' do
      subject.select_dish("Small chips", 2)
      subject.select_dish("Bread roll", 3)
      expect(subject.total).to eq 5.65
    end
  end

  describe 'submit order' do
    # it 'create message object' do
    #   order = Order.new
    #   order.select_dish("Small chips", 2)
    #   order.submit
    #   # expect(submit_confirm).to exist
    #   expect(order.submit_confirm).to exist
    # end
  end
end
