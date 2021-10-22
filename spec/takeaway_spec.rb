require 'takeaway'

describe Takeaway do

  it 'should display a welcome message' do
    message = 'Welcome to Trelawny field, di baddest kitchen inna England!'
    expect(subject.welcome).to eq message
  end
end