require 'takeaway'

describe Takeaway do

  describe "#show_menu" do
    # it "check show_menu should not be empty" do
    #   expect(subject.show_menu).to_not be_empty
    # end
    it { is_expected.to respond_to(:show_menu) }
  end

  describe "#choose_food" do
    it { is_expected.to respond_to(:choose_food) }
  end

  describe "#view_order" do
    it { is_expected.to respond_to(:view_order) }
  end

  describe "#confirm_order" do
    it { is_expected.to respond_to(:confirm_order) }
  end

end
