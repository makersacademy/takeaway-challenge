require "order"

describe Order do
  let(:dish) { double :dish }
  subject { Order.new(dish) }

  it { is_expected.to respond_to(:view_selected) }

  it "is not confirmed when created initially" do
    expect(subject).to_not be_confirmed
  end

  it "will display the selected dishes" do
    expect(subject.view_selected).to include(dish => 1)
  end

  it "will update the selected dishes with new dish" do
    subject.update(dish, 5)
    expect(subject.view_selected).to include(dish => 5)
  end

end
