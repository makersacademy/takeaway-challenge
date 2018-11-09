require 'takeaway'

describe Takeaway do
    context 'User stories' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'shows list of dishes with prices' do
    takeaway = Takeaway.new
    expect{ takeaway.show_menu }.not_to raise_error
    end
  end
end
