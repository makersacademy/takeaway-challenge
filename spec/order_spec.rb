require "order"

describe Order do
  let(:dish) { double :dish }
  subject { Order.new(dish) }

  it "is not confirmed when initially created" do
    expect(subject).to_not be_confirmed
  end

  it { is_expected.to respond_to(:view_selected) }

  context "when viewing an individual order" do
    it "displays selected dishes" do
      expect(subject.view_selected).to include(dish)
    end

    it "updates selected dishes with new dish" do
      subject.update(dish, 2)
      expect(subject.view_selected).to include(dish, dish)
    end

    it "displays total price" do
      allow(dish).to receive(:price).and_return(10)
      subject.update(dish, 1)
      expect(subject.view_total).to eq 20
    end
  end
end