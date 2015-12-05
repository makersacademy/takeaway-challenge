require 'takeaway'

describe 'User stories' do
  let(:takeaway)  { Takeaway.new }

  it 'brings up list of dishes with prices' do
    expect(takeaway.menu).not_to be_empty
  end

end
