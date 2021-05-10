require './docs/menu'

describe Menu do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  describe 'show' do
    it 'shows the menu including prices' do
    expect(subject.show).to eq nil
    end
  end

end