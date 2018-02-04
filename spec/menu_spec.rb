require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe "#initialize" do
    it "has a hash of dishes" do
      expect(menu.dishes).to be_a(Hash)
    end
    
  end

end
