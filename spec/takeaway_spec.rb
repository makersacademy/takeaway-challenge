require "takeaway.rb"

describe Takeaway do
  describe "#show_menu" do
    context "when requested" do
      it "shows menu" do
        expect { subject.show_menu }.not_to raise_error
      end
    end
  end
end
