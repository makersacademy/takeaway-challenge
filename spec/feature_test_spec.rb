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
    expect{ takeaway.display }.to output{<<-MENU.strip_heredoc
      Sushi Takeaway Menu
      Salmon roll     £5
      Tuna roll       £6
      Crab roll       £7"
      MENU
    }.to_stdout
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'can select some number of several available dishes' do
    takeaway.select("Salmon roll",2)
    expect(takeaway.order).to include({"Salmon roll"=>2})
  end
end
