require 'menu'
describe Menu do
  subject(:menu) {Menu.new}
  context "Method check" do
  it {is_expected.to respond_to :view_menu}
  end
  describe "#initialize" do
    it 'starts with a menu of items' do
      expect(subject.view_menu).not_to be_empty
    end
  end
end