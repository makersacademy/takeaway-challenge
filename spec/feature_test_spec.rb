require_relative '../lib/takeaway'

describe 'Feature Tests' do
  let(:takeaway) { Takeaway.new }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'displays a list of dishes with prices' do
    dishes = "Sushi Takeaway Menu\n
              Salmon roll     £5\n
              Tuna roll       £6\n
              Crab roll       £7"
    expect{ takeaway.display_menu }.to output("Sushi Takeaway Menu\nSalmon roll    £5\nTuna roll      £6\nCrab roll      £7\n").to_stdout
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'can select some number of several available dishes' do
    takeaway.select("Salmon roll",2)
    expect(takeaway.order).to include({"Salmon roll"=>2})
  end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
it 'checks dishes ordered sum up to the total' do
  takeaway.select("Salmon roll",2)
  takeaway.select("Crab roll",1)
  expect(takeaway.total).to eq 17
end

end
