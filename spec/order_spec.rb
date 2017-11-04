require 'order'

describe Order do

  let(:set_menu) { Order.new( { 1 => [:pizza, 5] } ) }
  #let(:menu) { { 1 => [:pizza, 5] } }

  describe "Instantiation" do
    context "when instantiating" do
      it "should be an instance of class Order" do
        expect(subject).to be_an_instance_of(Order)
      end
    end
  end

  describe "#menu" do
    context "when reading the menu" do
      it "should return hash containing menu items" do
        expect(set_menu.menu).to eq( { 1 => [:pizza, 5] } )
      end
    end
  end

  describe "#add_to_order" do
    context "when placing an order" do
      it "should accept two arguments" do
        expect(subject).to respond_to(:add_to_order).with(2).arguments
      end
    end
  end
end
