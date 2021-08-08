require './lib/menu'

describe Menu do
  let(:expected) { [
    "Starters",
    "Soup of the day £3",
    "Garlic bread £3",
    "",
    "Mains",
    "Pizza £11",
    "Fish and chips £15",
    "Burger £12",
    "Seabass £16",
    "",
    "Desserts",
    "Chips £4",
    "Salad £3",
    "",
    "Sides",
    "Tiramisu £6",
    "Chocolate fudge cake £7"
    ].join("\n") }

  describe '#print_menu' do
    
    it 'puts the menu' do
      expect { subject.print_menu }.to output(/#{expected}$/).to_stdout
    end

  end


end