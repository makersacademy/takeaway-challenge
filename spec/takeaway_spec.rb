require 'takeaway'

describe Takeaway do

  describe '#print_menu' do

    it 'puts menu' do

      expect { subject.print_menu }.to output("Apple Pie: 4.5\nBanana Pie: 4.5\nTiramisu: 5\n").to_stdout

    end

  end

  describe '#add_to_order' do

    it 'adds to order if part of menu' do

      subject.add_to_order("Apple Pie", 2)
      expect(subject.order).to eq ({"Apple Pie" => 2})

    end

    it 'raises an error if dish is no part of the menu' do

      expect { subject.add_to_order("Coffee Pie", 4) }.to raise_error 'Not part of the menu'

    end

  end

end
