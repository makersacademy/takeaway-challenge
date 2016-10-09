require 'menu'

describe Menu do

  subject{described_class.new}

  describe '#print_menu' do
    it 'prints the menu to the terminal' do
      expect(subject.print_menu).to eq ({
        1 => "Chicken Chow Mein (£6.75)",
        2 => "Pork Rendang (£5.50)",
        3 => "Pad Thai (£6.90)",
        4 => "Chicken Parmo (£4.50)",
        5 => "Paneer Korma (£5.50)",
        6 => "Onion Bahji (£2.50)"
      })
    end
  end

end
