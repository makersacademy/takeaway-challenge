require 'customer'

describe Customer do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
    it "customer can view dishes" do
      expect {subject.view_dishes}
    end

end
