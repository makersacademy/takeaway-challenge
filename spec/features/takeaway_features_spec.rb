require './lib/takeaway'
describe '#features' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'creates a new takeaway and reads menu' do
    takeaway = Takeaway.new
    takeaway.read_menu
  end
end
