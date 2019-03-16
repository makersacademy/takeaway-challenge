require "order"

describe Order do
  let(:dish) { double :dish }
  subject { Order.new(dish) }

  it "is not confirmed when initially created" do
    expect(subject).to_not be_confirmed
  end

  it { is_expected.to respond_to(:view_selected) }

  it "displays selected dishes" do
    expect(subject.view_selected).to include(dish => 1)
  end

  it "updates selected dishes with new dish" do
    subject.update(dish, 2)
    expect(subject.view_selected).to include(dish => 2)
  end
end