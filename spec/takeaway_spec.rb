require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) {described_class.new}


  it 'has a list of dishes' do
    expect(takeaway.menu).to be_an_instance_of(Dishes)
  end


  # it 'prints a list of dishes' do
  #   expect(takeaway.list).to
  # end








end
