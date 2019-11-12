require 'order'

describe Order do
  it { is_expected.to be_instance_of Order }

  it "should initially be empty" do
    expect(subject.my_order).to eq({})
  end

  it { should respond_to(:add).with(1).argument }
end
