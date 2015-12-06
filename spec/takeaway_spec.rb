require 'takeaway'

describe Takeaway do
  subject(:takeaway){described_class.new}

  it 'takeaway responds to see_menu' do
    expect(takeaway).to respond_to(:see_menu)
  end


end
