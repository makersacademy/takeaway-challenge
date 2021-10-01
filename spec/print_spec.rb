require "print"

describe Print do
  describe "#print_dishes" do
    let(:course) { instance_double(Restaurant, :dishes => { 1 => ["cod", "£6"] }) }
    it "outputs the available dishes" do
      printer = Print.new(course)
      expect(printer.print_dishes).to eq({ 1 => ["cod", "£6"] })
    end
  end
  describe "#print_selection" do
    let(:selection) { instance_double(Order, :select => ["cod", "£6"]) }
    it "outputs the selected meals" do
      printer = Print.new(Restaurant.new, selection)
      expect(printer.print_selection).to eq(["cod", "£6"])
    end
  end
end
