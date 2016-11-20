require 'menu'

describe Menu do

  describe '#print' do

    it 'prints out the menu' do
      menu = "Curry £9\nBurger £8\nPizza £10\nNoodles £5\nChicken £5\nKebab £6\n"
      expect { subject.print }.to output(menu).to_stdout
    end

  end

  describe '#does_not_contain?' do

    it 'returns true when passed a dish not in the list' do
      expect(subject.does_not_contain?("Apples")).to eq true
    end

  end

end
