require 'menu'

describe Menu do
  let(:menu_items) { Menu.new.view_menu }
  it "stores the menu itmes in a hash" do
  end

  describe '#view_menu' do
    it "shows the menu items" do
      expect(subject.view_menu).to eq menu_items
    end
  end
end
