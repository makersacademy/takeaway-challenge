require 'takeaway'

describe Takeaway do
  subject(:menu_double) { double :menu }
  subject(:takeaway) { Takeaway.new(menu_double) }

  describe '#see_menu' do
    it 'puts a formatted list of menu items to the customer' do
      allow(menu_double).to receive(:print_menu) { ["Large Fish Supper - 7.90"] }
      expect { takeaway.see_menu }
        .to output("Large Fish Supper - 7.90\n")
          .to_stdout
    end
  end

  describe '#select(dish,quantity)' do
    it 'raises an error if the dish does not exist' do
      allow(menu_double).to receive(:not_on_menu?) { true }
      expect {takeaway.select("Large Fssssh Supper",2)}.to raise_error("I'm sorry, we don't have that on our menu.")
    end
    it 'returns "Dish added!"' do
      allow(menu_double).to receive(:not_on_menu?) { false }
      expect(takeaway.select("Large Fish Supper",2)).to eq "Dish added!"
    end
  end
end
