# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

require 'takeaway'

describe Takeaway do
  it 'Should have a takeaway class' do
    expect(Takeaway).to respond_to(:new)
  end
end
