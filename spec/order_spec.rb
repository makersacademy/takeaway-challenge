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
end
