describe 'User Stories' do

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
it 'should have the takeaway show a list of prices' do
  takeaway = Takeaway.new
  list = List.new
  expect { takeaway.show_list(list)}.to_not raise_error
end

end
