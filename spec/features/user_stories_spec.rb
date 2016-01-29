describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customer can see a list of dishes with prices' do
    takeaway = Takeaway.new
    expect(takeaway.see_menu).to be_an_instance_of(Array)
  end

end