require "Menu_Loader"

describe MenuLoader do
  let(:yaml) {double :YAML, load: [{name: "plain noodles", price: 400}]}
  let(:menu) {double :menu, menu_location: "nil", add_to_menu: nil}
  let(:file) {double :File, open: nil}
  describe "#load " do
    before(:each) {subject.load menu,yaml, file}
    it "should ask menu for its file location" do
      expect(menu).to have_received :menu_location
    end
    it "should try to add items to the menu" do
      expect(menu).to have_received :add_to_menu
    end
  end
end
