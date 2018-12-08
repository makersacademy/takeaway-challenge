require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  it 'instructs the menu to display' do
    expect(subject).to respond_to(:display).with(1).argument
  end
end
