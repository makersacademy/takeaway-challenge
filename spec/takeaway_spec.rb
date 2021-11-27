require 'takeaway'
describe Takeaway do
  subject { Takeaway.new }
  let(:dish) { double("Chicken") }
  let(:price) { double("£4") }
  let(:choice) { double(:choice)}

  describe "#initialize" do
    it "menu array" do
      expect(subject.menu).to be_truthy
    end

    it "empty orders array" do
      expect(subject.orders).to eq []
    end
    
  end

  describe "#add_dishes" do
    it { is_expected.to respond_to(:add_dishes).with(2).argument }
  end
  
  describe "#print_menu" do
    it "displays menu" do
      list_of_dishes = subject.print_menu
      expect(subject.print_menu).to eq(list_of_dishes)
    end
  end

  describe "#add_orders" do
    it { is_expected.to respond_to(:add_orders).with(1).argument } 
  end

  it "add choice to orders array" do
    subject.add_orders(choice)
    expect(subject.orders).to include(choice)
  end

  it "sum of the order" do
    subject.add_orders("rice")
    subject.add_orders("beans")
    subject.add_orders("yam")
    expect(subject.orders_total).to eq 8
  end 
end
