require 'takeaway'

describe Takeaway do
  describe '#view_menu' do
    it 'displays the menu' do
      displayed_menu = "1. prawn cracker....£2\n2. spring roll....£3\n"
      menu_double =  double(:menu, display: displayed_menu)
      takeaway = Takeaway.new(menu_double.display)
      expect { takeaway.view_menu }.to output(displayed_menu).to_stdout
    end
  end

  describe '#add' do
    it 'adds dishes to basket' do
      subject.add('prawn cracker', 1)
      subject.add('spring roll', 2)
      expect(subject.basket).to eq({ 'prawn cracker' => 1, 'spring roll' => 2 })
    end

    it 'confirms if an order has been added' do
      message = "1x prawn cracker(s) added to your basket\n"
      expect { subject.add('prawn cracker', 1) }.to output(message).to_stdout
    end

    it 'raises error if a dish is not in the menu' do
      message = "burger is not available, please choose dishes from menu"
      expect { subject.add('burger', 1) }.to raise_error(message)
    end
  end
end
