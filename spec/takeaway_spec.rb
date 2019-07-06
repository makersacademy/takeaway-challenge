require 'Takeaway'

describe Takeaway do
  let(:takeaway) {described_class.new}

  it "prints a list" do
    expect(takeaway.list).to start_with("- Kappa Maki => £8")
  end
end
