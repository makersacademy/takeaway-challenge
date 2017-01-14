require 'takeaway.rb'

describe Takeaway do
  describe "#show_menu" do
    context "when requested" do
      it "shows menu" do
        expect { subject.show_menu }.not_to raise_error
        expect(subject.menu).not_to eq nil
        expect(subject.show_menu).to be_a Array
      end
    end
  end

  describe "#order" do
    context "when requested" do
      it "can order food" do
        expect { subject.order }.not_to raise_error
      end
    end
  end


end
