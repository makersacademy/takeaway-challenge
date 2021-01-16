require 'takeaway'
require 'menu'

describe Takeaway do

  let(:menu) { Menu.new }

  describe "display_menu" do
      it "displays the menu" do
        expect(subject.display_menu).to eq(menu.show_menu)
      end
    end
end
