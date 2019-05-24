require 'order'

describe Order do
  context "#initialize" do
    it "should have a menu of items" do
      expect(subject.menu).not_to be_nil
    end
  end

end
