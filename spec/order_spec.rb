describe Order do
  subject(:order) { described_class.new(:pizza)}

  describe '#initialize' do

    it 'creates an empty order' do
      expect(order.selected_dishes).to be_empty
    end

    it 'has a zero total' do
      expect(order.total).to eq 0
    end

    it 'sets a category' do
      expect(order.category).to be :pizza
    end

  end

  describe '#add' do

    let(:orders) { [
                  [{ name: "Margherita", price: 9.00 }, 2],
                  [{ name: "American", price: 8.75 }, 1],
                  [{ name: "Garlic Bread", price: 3.50 }, 3],
                  [{ name: "Salad", price: 4.25 }, 2]
                  ] }
    let(:order_total) do
      orders.reduce(0) do |total, order|
        total += (order[0][:price] * order[1])
      end
    end

    before do
      orders.each do |selection|
        order.add(selection[0], selection[1])
      end
    end

    it 'adds items to the list of selected dishes' do
      expect(order.selected_dishes.count).to be 4
    end

    it 'sets the total' do
      expect(order.total).to eq order_total
    end

  end

end
