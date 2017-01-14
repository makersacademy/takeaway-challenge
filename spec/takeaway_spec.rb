require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'Allows takeaway to view menu' do
    expect(takeaway).to respond_to(:view_menu).with(0).argument
  end
end
