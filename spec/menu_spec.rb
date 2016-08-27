require "menu"

describe Menu do

subject(:menu) {described_class.new}
let (:list) {double :list}

  describe '#print_menu' do

    it "prints the menu" do
      expect(menu.print_menu).to_not be nil
    end

  end


end
