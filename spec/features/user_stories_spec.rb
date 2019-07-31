require 'takeaway'

describe 'user stories' do
  it 'customers can see a list of dishes with prices' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    takeaway = Takeaway.new
    expect(takeaway.menu).to eq true
  end
end