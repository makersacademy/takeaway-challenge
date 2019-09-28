require 'order'

describe Order do

  let(:menu) { double("Menu") }

  describe '#initialize' do
    it 'total_order list exists and is empty' do
      expect(subject.total_order).to be_empty
    end
  end

  describe '#read_menu' do
    it 'lists the items and prices on the menu' do
      expect do
        subject.read_menu
      end.to output("pizza: £8.0\nburger: £5.0\nchips: £2.0\nfish: £6.0\nfalafel_wrap: £4.5\n").to_stdout
    end
  end

  describe '#add_item' do

    it 'adds 3 chips to the order and returns a message to the customer' do
      expect do
        subject.add_item(:chips, 3)
      end.to output("3x chips(s) added to your basket\n").to_stdout
    end

    it 'adds 1 pizza and 2 kebabs to the order' do
      subject.add_item(:pizza)
      subject.add_item(:kebab, 2)
      expect(subject.total_order).to eq [{ pizza: 1 }, { kebab: 2 }]
    end
  end

end
