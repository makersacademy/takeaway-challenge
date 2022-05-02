require 'menu'

describe Menu do

  describe '#print_menu' do

    it 'prints the menu' do

      expect { subject.print_menu }.to output("Apple Pie: 4.5\nBanana Pie: 4.5\nTiramisu: 5\nCarrot Cake: 4\nBrownie: 4\n").to_stdout

    end

  end

  describe '#in_menu?' do

    it 'returns true when dish is on the menu' do

      expect(subject.in_menu?("Apple Pie")).to eq(true)

    end

    it 'returns false when dish is not on the menu' do

      expect(subject.in_menu?("Coffee")).to eq(false)

    end

  end

end
