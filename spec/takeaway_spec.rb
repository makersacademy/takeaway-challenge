require 'takeaway.rb'

describe Takeaway do
  describe "#initialize" do
    context "when created" do
      it "shows menu" do
        expect { subject.menu }.not_to raise_error
      end
    end
  end
  #
  describe "#order" do
    context "when requested" do
      it "can order food" do
        expect { subject.order }.not_to raise_error
      end
    end
  end


end
