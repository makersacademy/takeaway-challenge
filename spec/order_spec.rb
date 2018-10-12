require 'order'

describe Order do
  let(:menu) { double :menu, :items => {"Margarita Pizza" => 8, "Hamburger" => 6, "Chips" => 2} }

  context '#initialize' do
    it 'creates a new order with a total of 0' do
      expect(subject.total).to eq 0
    end
  end

  context '#add' do
    it 'adds an item to the order' do
      subject.add("Margarita Pizza")
      expect(subject.total).to eq 8
    end

    it 'adds 2 items to the order' do
      subject.add("Margarita Pizza")
      subject.add("Chips")
      expect(subject.total).to eq 10
    end
  end

  context '#order_total' do
    it 'shows the individual items and the total of the order' do
      subject.add("Margarita Pizza")
      subject.add("Chips")
      expect{subject.order_total}.to output("Margarita Pizza, £8\nChips, £2\n---\nYour order total is £10\n").to_stdout
    end
  end
end
