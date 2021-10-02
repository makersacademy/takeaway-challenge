require "takeaway"

RSpec.describe Takeaway do
  let(:takeaway) { Takeaway.new }
  let(:option) { double :option, :user_options => 1 }

  it "prints a list of options for the user" do
    expect(takeaway.user_options).to eq 1
  end
end
