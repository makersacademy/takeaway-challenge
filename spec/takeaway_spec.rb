require 'takeaway'

describe TakeAway do

  let(:takeaway) { TakeAway.new }

  it 'takes the customers name' do
    expect(takeaway.customer).to eq('kevin')
  end

end