require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'displays the menu' do
    expect(takeaway).to respond_to(:display_menu)
  end

end
