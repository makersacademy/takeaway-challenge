require 'menu'

describe Menu do

  let(:dish1) { double :dish1, name: "Burrito", price: 5 }
  let(:dish2) { double :dish1, name: "Pizza", price: 10 }
  let(:dish3) { double :dish1, name: "Burger", price: 15 }
  let(:dish_list) { [ dish1, dish2, dish3 ] }
  let(:printed_menu) { "- Burrito - £5\n- Pizza - £10\n- Burger - £15\n" }
  let(:dish_query) { "Burger" }
  let(:bad_dish_query) { "Pizzzzzaaas" }
  subject(:menu) { described_class.new(dish_list) }


  it 'should be initialised with a list of dishes' do
    expect(menu.dish_list).to eq dish_list
  end

  describe '#list_dishes' do
    it 'should print a list of available dishes' do
      expect { menu.print_menu }.to output(printed_menu).to_stdout
    end
  end

  describe '#includes?' do
    it 'returns true if the dish is on the menu' do
      expect(subject.includes?(dish_query)).to eq true
    end

    it 'returns false if the dish is not on the menu' do
      expect(subject.includes?(bad_dish_query)).to eq false
    end
  end
end
