require 'menu'

describe Menu do

  context '#show' do
    it 'should display menu' do
      # output = <<~MENU 
      #   1. Chips - £1
      #   2. Tofu - £2
      #   3. Broccoli - £1
      #   4. Ice_cream - £2 
      # MENU
      # expect { subject.show }.to output(output).to_stdout

      expect { subject.show }.to output("1. Chips - £1\n2. Tofu - £2\n3. Broccoli - £1\n4. Ice_cream - £2\n").to_stdout
    end
  end

  context '#check' do
    it 'dish against menu and return false' do
      wrong_spelling = "Brocoli"
      expect(subject.check(wrong_spelling)).to eq false
    end
    it 'dish against menu and return true' do
      right_spelling = "Broccoli"
      expect(subject.check(right_spelling)).to eq true
    end
  end

  context '#price' do
    it 'returns the price of an item' do
      expect(subject.price("Broccoli")).to eq 1
    end
  end
end
