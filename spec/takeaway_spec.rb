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
end
