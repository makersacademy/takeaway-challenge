require 'takeaway'

describe Takeaway do 
  it 'should be able to return a menu when requested' do
    expect(subject.view_menu).to eq menu
  end
end
