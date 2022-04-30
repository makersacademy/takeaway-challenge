require 'takeaway'

describe Takeaway do

  describe '#print_menu' do

    it 'puts menu' do

      expect { subject.print_menu }.to output("Apple Pie: 4.5\nBanana Pie: 4.5\nTiramisu: 5\n").to_stdout

    end

  end

end
