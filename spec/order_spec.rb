require 'order'

describe Order do
  it 'reads the menu' do
    expect do
      subject.read_menu
    end.to output("pizza: £7.0\nkebab: £8.0\nburger: £5.0\nchips: £3.0\n").to_stdout
  end

  it 'adds 2 pizzas to order' do
    expect do
      subject.add_item(:pizza, 2)
    end.to output("2x pizza(s) added to your basket\n").to_stdout
  end

  context 'ordered 1 pizza and 3 kebabs' do
    before(:each) do
      subject.add_item(:pizza)
      subject.add_item(:kebab, 3)
    end

    it 'records the total order' do
      expect(subject.total_order).to eq [{ pizza: 1 }, { kebab: 3 }]
    end
    it 'shows the basket summary' do
      expect do
        subject.basket_summary
      end.to output("pizza x1 = £7.0, kebab x3 = £24.0\n").to_stdout
    end
    it 'returns the total cost of the order' do
      expect(subject.total_cost).to eq 31
    end
  end

end
