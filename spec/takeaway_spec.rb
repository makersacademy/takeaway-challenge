require './lib/takeaway.rb'

describe Takeaway do
  let(:takeaway) { described_class.new }

  describe '#initialize' do
    it 'is initialized with dishes' do
      complete_menu = { :starters => { 1 => { "Olives" => 4 } , 2 => { "Pitta bread" => 5 } }, :main_course => { 3 => { "Fried duck" => 12 }, 4 => { "Fish & Chips" => 9 } }, :dessert => { 5 => { "Jam roll" => 5 }, 6 => { "Apple crumble" => 6 } } }
      expect(takeaway.menu).to eq complete_menu
    end
    it 'is initialized with a basket' do
      expect(takeaway.basket).to eq []
    end
  end

  describe '#lists_dishes_with_prices' do
    it 'lists all menu dishes with prices' do
      all_dishes = "Starters: Olives = £4, Pitta bread = £5 -- Main Course: Fried duck = £12, Fish & Chips = £9 -- Dessert: Jam roll = £5, Apple crumble = £6."
      expect(takeaway.lists_dishes_with_prices).to eq all_dishes
      #expect(takeaway.lists_dishes_with_prices).to output(all_dishes).to_stdout
    end
  end

  xdescribe '#select_dishes' do
    it 'has a basket that contains the selected dishes' do
      takeaway.select_dishes("Starters: Olives = £4", "Main Course: Fish & Chips = £9", "Dessert: Jam roll = £5" )
      expect(takeaway.basket).to eq "Starters: Olives = £4 -- Main Course: Fish & Chips = £9 -- Dessert: Jam roll = £5."
    end
  end
end
