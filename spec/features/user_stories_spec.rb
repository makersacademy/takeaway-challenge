# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe 'User Stories' do
  it 'so customer can check dishes, return list of dishes with prices' do
    dishes = Dishes.new
    expect(dishes.prices).to be_an_instance_of(Hash)
  end
end
