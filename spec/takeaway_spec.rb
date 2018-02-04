require 'Takeaway'

describe Takeaway do

subject(:takeaway) {described_class.new}

  describe"#initialize"do
    it"returns the menu" do
      expect(takeaway.menu).not_to be_nil
    end
  end
  describe"#show_menu" do
    it"shows the menu" do
      expect(takeaway.show_menu).not_to be_nil
    end
  end
end
