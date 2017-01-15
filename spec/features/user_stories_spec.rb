
describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so that orders can be placed, show menu' do
    t = Takeaway.new
    expect { t.dishes }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so that some no. of several dishes can be ordered, takes order from menu into basket' do
    t = Takeaway.new
    expect { t.basket }.not_to raise_error
  end
end
