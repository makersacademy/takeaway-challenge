require 'order'

describe Order do
  it 'reads the menu' do
    expect do
      subject.read_menu
    end.to output("pizza: £7.0\nkebab: £8.0\nburger: £5.0\nchips: £3.0\n").to_stdout
  end

  it 'adds 1 pizza to then order, then 3 kebabs' do
    subject.add_item(:pizza)
    subject.add_item(:kebab, 3)
    expect(subject.total_order).to eq [{ pizza: 1 }, { kebab: 3 }]
  end

  context 'ordered 1 pizza and 3 kebabs' do
    before(:each) do
      subject.add_item(:pizza)
      subject.add_item(:kebab, 3)
    end
    it 'returns the total cost of the order' do
      expect(subject.total_cost).to eq 31
    end
  end

end
