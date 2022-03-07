require "menu"
describe Menu do

  describe "#view_menu" do
    it "responds to #view_menu" do
      expect(subject).to respond_to(:view_menu)
    end
  end

  describe "#add_to_order" do
    it "responds to add_to_order" do
      expect(subject).to respond_to(:add_to_order)
    end
  end
end