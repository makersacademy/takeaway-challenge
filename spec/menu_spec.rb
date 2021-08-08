require './lib/menu'

describe Menu do
  let(:expected) { [
    "Starters",
    "(1) Soup of the day £3",
    "(2) Garlic bread £3",
    "",
    "Mains",
    "(3) Pizza £11",
    "(4) Fish and chips £15",
    "(5) Burger £12",
    "(6) Seabass £16",
    "",
    "Desserts",
    "(7) Chips £4",
    "(8) Salad £3",
    "",
    "Sides",
    "(9) Tiramisu £6",
    "(10) Chocoate fudge cake £7",
    ""
    ].join("\n") }

  describe '#print_menu' do
    
    it 'puts the menu' do
      expect { subject.print_menu }.to output(/#{expected}$/).to_stdout
    end

  end


end