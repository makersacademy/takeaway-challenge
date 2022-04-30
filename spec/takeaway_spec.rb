require_relative 'takeaway.rb'

describe Takeaway do
  it 'responds to Takeaway class' do
    expect(subject).to be_aTakeaway
  end
end