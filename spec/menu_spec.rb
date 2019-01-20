require 'menu'

RSpec.describe Menu do

  context "#menu" do
    it "should print a menu in an hash" do
      expect(subject.menu).to be_kind_of Hash
    end
  end
end
