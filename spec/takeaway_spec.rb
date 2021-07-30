require 'takeaway'

describe TakeAway do
  let(:takeaway) { TakeAway.new }
  it 'should create a takeaway' do
    expect(takeaway).to receive(:read_menu)
  end

  it 'should display menu with list of prices' do
    expect(takeaway).to respond_to(:read_menu)
  end
  
end
