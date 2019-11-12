require 'order'

describe Order do
  it { is_expected.to be_instance_of Order }

  it "should initially be empty" do
    expect(subject).to eq {}
  end
end
