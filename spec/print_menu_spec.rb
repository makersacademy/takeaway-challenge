require '/Users/duncanskinner/Documents/makers_academy/course/week_2/challenges/weekend_challenge/takeaway-challenge/lib/print_menu.rb'

describe PrintMenu do
  subject(:print_menu) { described_class.new }

  it 'initializes with an array of hashes' do
    expect(print_menu.menu).to include({dish: "Egg fried rice", price: 3})
  end

  describe '#see_menu_list' do
    it 'should print the menu list out' do
      expect{ print_menu.see_menu_list }.to output.to_stdout
    end

    it 'should print out a items' do
      expect{ print_menu.see_menu_list }.to output.to_stdout
    end
  end
end
