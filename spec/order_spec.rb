require "order"

describe Order do
    describe "#take_order" do
      it "exists" do
        expect(subject).to respond_to(:take_order)
      end
    end

    describe "#display_order" do
      it { should_not be_kind_of(String) }
    end

end
