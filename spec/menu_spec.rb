require 'menu'

describe Menu do
  subject(:menu){described_class.new}

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'output menu list to stdout' do
    expect{menu.list_menu}.to output.to_stdout
  end

end
