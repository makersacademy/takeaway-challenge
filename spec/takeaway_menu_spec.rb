require "takeaway_menu"

describe TakeawayMenu do
  let(:takeaway_menu) { TakeawayMenu.new }

  context "initialize" do
    it "successfully instantiates the TakeawayMenu class" do
      expect(takeaway_menu).to be_instance_of(TakeawayMenu)
    end
  end
end
