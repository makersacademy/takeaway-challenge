require 'customer'

describe Customer do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with
  it "Customer can view dishes" do
    expect { Customer.view_dishes }
  end

end
