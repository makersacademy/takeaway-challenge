require 'order'

describe Order do
  it { is_expected.to be_instance_of Order }

  it "should initially be empty" do
    expect(subject.order).to eq({})
  end

  it "should intially cost nothing" do
    expect(subject.total_cost).to eq 0
  end

  it { should respond_to(:add).with(1).argument }

  it "should allow items to be added to the order and record the number of that item that has been added" do
    subject.add("test")
    expect(subject.order).to eq ({"test" => 1})
  end
end
