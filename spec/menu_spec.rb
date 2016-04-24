require 'menu'

require 'menu'

describe Menu do

  subject(:menu) { described_class.new() }
  let(:dish) { double(:dish, print_dish: 'dish') }
  let(:dish1) { double(:dish1, print_dish: 'dish1') }
  let(:dish2) { double(:dish2, print_dish: 'dish2') }

  it '#add_dish' do
    menu.add_dish(dish)
    expect(menu.dishes).to include dish
  end

  describe '#print_menu' do

    it 'prints each of the dishes' do
      menu.add_dish(dish)
      menu.add_dish(dish1)
      menu.add_dish(dish2)
      expect{ menu.print_menu }.to output("dish\ndish1\ndish2\n").to_stdout
    end
  end

end