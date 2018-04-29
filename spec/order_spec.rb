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

  context 'when orders have been added' do
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

    let(:order_print) {
      "2 x Margherita(£9.00)\n1 x American(£8.75)\n3 x Garlic Bread(£3.50)\n2 x Salad(£4.25)\nTotal: £#{order_total}\n"
    }

    before do
      orders.each do |selection|
        order.add(selection[0], selection[1])
      end
    end

    describe '#add' do

      it 'adds items to the list of selected dishes' do
        expect(order.selected_dishes.count).to be 4
      end

      it 'sets the total' do
        expect(order.total).to eq order_total
      end

    end

    describe '#print_order' do

      it 'prints the order correctly' do
        expect { order.print_order }.to output(order_print).to_stdout
      end

    end

  end


end
