require "order"

describe Order do
  it { is_expected.to be_an_instance_of Order }
  it { is_expected.to respond_to(:add).with(1).argument }

  describe "#order" do
    context "when ordering a Pizza" do
      it "should add Pizza to order" do
        subject.add("Pizza")
        expect(subject.order).to eq (["Pizza"])
      end
    end
    context "when consecutively ordering a Pizza and Pasta" do
      it "should add Pizza and Pasta to order" do
        subject.add("Pizza")
        subject.add("Pasta")
        expect(subject.order).to eq (["Pizza", "Pasta"])
      end
    end
    context "when ordering an item that is not actually on the menu" do
      it "should raise an error" do
        subject.add("Not on Menu")
        expect(subject.add).to fail("Sorry that item is not on the menu and will not be added.")
      end
    end
  end
end
