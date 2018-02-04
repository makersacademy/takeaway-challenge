require 'menu'

describe Menu do
  describe "#menu" do
    it "is an array of items" do
      expect(subject.menu).to be_an Array
    end
  end
end
