require 'takeaway'
describe Takeaway do
  subject { Takeaway.new }
  let(:dish) { double("Chicken") }
  let(:price) { double("£4") }

  describe "#initialize" do
    it "empty menu array" do
      expect(subject.menu).to eq []#truthy
    end
  end

  describe "#add_dishes" do
    it { is_expected.to respond_to(:add_dishes).with(2).argument }
  end
  
  describe "#print_menu" do
    it "displays menu" do
      menu_list = subject.add_dishes(dish, price)
      expect(subject.print_menu).to eq(menu_list)
    end
  end

end
