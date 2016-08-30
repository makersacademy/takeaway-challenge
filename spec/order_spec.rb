require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:menu) {double (:menu)}
  let(:message) {double(:message)}

  it { is_expected.to have_attributes(:current_order => [], :total => 0) }

  it "responds to add_dish" do
    expect(subject).to respond_to(:add_dish).with(2).arguments
  end

  it "responds to check_order" do
    expect(subject).to respond_to(:check_order)
  end

  it "responds to place_order" do
    expect(subject).to respond_to(:place_order)
  end

    describe "#add_dish" do
      it "should add items to current order" do
        expect {subject.add_dish("Pudweiser", 1)}.to change {subject.total}.by 4
      end
      it "raises an error if dish not inlcuded in menu" do
        expect {subject.add_dish("Lettuce")}.to raise_error("Unfortuantely, we do not have this dish.")
      end
    end

    describe "#check_order" do
      it "checks if total matches menu prices" do
        total = order.add_dish("Pudweiser", 1)
        expect(total).to eq 4
      end
      it "returns confirmation message" do
        expect(subject.check_order).to eq "Your total checks out."
      end
    end

    describe "#place_order" do
      it "returns confirmation message" do
        expect(subject.place_order).to eq "Thank you for your order."
      end
    end


end














