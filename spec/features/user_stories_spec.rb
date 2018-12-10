describe 'user_stories_spec' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'so customers can view menu, Takeaway should return a menu' do
    takeaway = Takeaway.new
    expect { takeaway.view_menu }.not_to raise_error
  end
end
