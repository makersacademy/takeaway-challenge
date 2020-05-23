require 'takeaway'

describe Takeaway do
  it 'creates a new instance of takeaway' do
    expect(subject).to be_instance_of Takeaway
  end

  it 'responds to view_menu' do
    expect(subject).to respond_to(:view_menu)
  end
end
