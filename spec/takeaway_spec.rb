### test

require 'takeaway'

describe Takeaway do
  it 'creates new Takeaway' do
    expect(Takeaway.new)
  end

  it { is_expected.to respond_to(:display) }

  let(:takeaway) { Takeaway.new }
  
  it 'calling display doesnt change value of LIST' do
    takeaway.display
    expect(List::LIST).to eq List::LIST # need outside opinion on
  end

end
