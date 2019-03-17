require "order"

describe Order do
  let(:dish) { double :dish }
  subject { Order.new(dish) }

  before do
    allow(dish).to receive(:price).and_return(10)
  end

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
      subject.update(dish, 1)
      expect(subject.view_total).to eq 20
    end
  end

  context "when finalising order" do
    it { is_expected.to respond_to(:confirm_order) }
    it { is_expected.to respond_to(:calculate_time) }

    it "sets order to confirmed" do
      subject.confirm_order
      expect(subject).to be_confirmed
    end

    it "displays a confirmation message" do
      expect(subject.confirm_order).to be_an_instance_of(String)
    end
  end
end
