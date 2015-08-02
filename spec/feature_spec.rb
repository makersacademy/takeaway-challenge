require "takeaway"
describe "Features" do
  describe "takeaway" do
    let (:takeaway) { Takeaway.new }
    it "displays menu items and prices" do
      our_menu = {"pizza" => 5.95, "pasta" => 6.45, "curry" => 6.95, "toast" => 0.1, "fajitas" => 6.45}
      expect(takeaway.menu).to eq our_menu 
    end
  end
end