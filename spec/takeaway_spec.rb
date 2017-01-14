require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  describe "view_menu" do
    it {is_expected.to respond_to(:view_menu)}

    context "so I can see what's on the menu" do
      it "returns menu items" do
        expect_any_instance_of(Menu).to receive(:items)
        takeaway.view_menu
      end
    end
  end
end
