require 'takeaway'

describe Takeaway do

  let(:instance_order) { double(:instance_order, :add_to_order => "anything") }
  let(:with_order) { described_class.new(instance_order) }

  describe "Instatiation" do
    context "When instantiating" do
      it "should be an instance of class Takeaway" do
        expect(subject).to be_an_instance_of(Takeaway)
      end
    end
  end

  describe "#dishes" do
    context "while looking for meals" do
      it "should return the dishes available" do
        expect(subject.dishes).to be_an_instance_of(Hash)
      end
      it "should return the dish pizza" do
        expect(subject.dishes[:pizza]).to eq(5)
      end
    end
  end

  describe "#order" do
    context "when creating a new order" do
      it "should be a new instance of class Order" do
        expect(with_order.order).to eq(instance_order)
      end
    end
  end

  describe "#select" do
    context "when selecting food" do
      it "should be added to your order" do
        expect(with_order.select("pizza", 2)).to eq("anything")
      end
    end
  end

  # describe "#list_dishes" do
  #   context "while viewing the menu" do
  #     it "should return a human readable menu" do
  #       expect { subject.view_dishes }.to output.to_stdout
  #     end
  #   end
  # end

end
