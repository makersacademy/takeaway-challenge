require 'takeaway'

describe Takeaway do

  describe '#show menu' do
    it 'prints the menu to the screen' do
      expect { subject.show_menu }.to output.to_stdout
    end
  end

  describe '#add_to_order' do
    it 'takes a dish and adds it to an order' do
      expect(subject.add_to_order('sushi')).to eq ['sushi']
    end

    it 'adds a dish to an order multiple times' do
      subject.add_to_order('sushi')
      expect(subject.add_to_order('sushi')).to eq ['sushi', 'sushi']
    end

    it 'works with two different dishes' do
      subject.add_to_order('sushi')
      expect(subject.add_to_order('burger')).to eq ['sushi', 'burger']
    end

    it 'raises an error when passed a dish not on the menu' do
      expect { subject.add_to_order('foo') }.to raise_error 'foo not on menu'
    end
  end

  describe '#show_order' do
    it 'prints the order with the price' do
      subject.add_to_order('sushi')
      expect { subject.show_order }.to output("Sushi: £1\nTotal: £1\n").to_stdout
    end

    it 'works with multiple dishes, including duplicates' do
      subject.add_to_order('sushi')
      subject.add_to_order('burger')
      subject.add_to_order('sushi')
      expect { subject.show_order }.to output("Sushi: £1\nBurger: £2\nSushi: £1\nTotal: £4\n").to_stdout
    end
  end

  describe '#confirm_order' do
    it 'is implemented'
  end
end
