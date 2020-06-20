require "order"

describe Order do
  let(:order) { Order.new }
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  
  describe "initialize" do
    it "creates an instance of an order" do
      expect(subject).to be_an_instance_of(Order)
    end
    
    it "stores quantities of added dishes in an array" do
      expect(subject.trolley).to be_an_instance_of(Array)
    end
    
    it "is empty when creating a new order" do
      expect(subject.trolley).to be_empty
    end
    
    it "has a total equal to zero" do
      expect(subject.total).to eq(0)
    end
  end
  
  describe "#view_menu" do
    it "returns the menu" do
      expect(subject.view_menu(menu)).to eq menu
    end
  end
  
  describe "#add_dish" do
    it { is_expected.to respond_to(:add_dish).with(1).argument }

    xit "stores added dishes using dish names and prices" do
      expect { subject.add_dish(dish) }.to change{ subject.trolley.length }.by 1
    end
  end
end
