require 'menu'

  describe Menu do

    subject(:menu) { described_class.new }

      describe "#view" do

        it "should return a list of available dishes" do
          expect(menu.view).to eq Menu::MENU_ITEMS
        end

      end
    end
