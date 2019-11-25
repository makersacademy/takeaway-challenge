require 'menu'
describe Menu do
  subject(:menu) { described_class.new }
  describe "#list" do
    it "displays a list of dishes with price" do
      expect(menu).to respond_to(:list)
    end
  end
end
