require 'menu'

describe Menu do

  describe "show dishes" do
    it { is_expected.to respond_to :show_menu }

    subject(:menu) { described_class.new }

    it "shows a list of meals" do
      expect(menu.show_menu).to eq(menu.english_menu)
          end
        end
      end
