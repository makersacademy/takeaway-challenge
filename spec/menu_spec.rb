require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe "#initialize" do
    it "should have an items hash" do
      expect(menu.items).to be_a(Hash)
    end
  end
end
