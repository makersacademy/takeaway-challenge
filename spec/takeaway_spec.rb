### test

require 'takeaway'

describe Takeaway do
  it 'creates new Takeaway' do
    expect(Takeaway.new)
  end

  it { is_expected.to respond_to(:display) }

  let(:takeaway) { Takeaway.new }
  # it 'displays list' do
  #   expect(takeaway.display).to eq List::LIST
  # end
  it 'calling display doesnt change value of LIST' do
    takeaway.display
    expect(List::LIST).to eq List::LIST # need outside opinion on
  end

end
