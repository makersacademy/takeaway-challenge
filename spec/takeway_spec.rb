require 'takeaway'

describe Takeaway do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'should show list of dishes with prices' do
    takeaway = Takeaway.new

    expect(takeaway.show_list).to eq takeaway.dishes

  end

end
