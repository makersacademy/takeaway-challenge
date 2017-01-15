require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:non_existant_dish) {double :dish}
  let(:dish1) {double :dish}
  let(:dish2) {double :dish}

  describe "#view_menu" do
    it {is_expected.to respond_to(:view_menu)}

    context "so I can see what's on the menu" do
      it "returns menu items" do
        expect_any_instance_of(Menu).to receive(:print)
        takeaway.view_menu
      end
    end
  end

  describe "#add_to_order" do
    context "So I can order dishes" do
      it "allows me to select dishes and amount" do
        takeaway.add_to_order(dish1, 2)
        takeaway.add_to_order(dish2, 1)
        expect(takeaway.order).to eq ({dish1 => 2, dish2 => 1})
      end
    end
  end
end
