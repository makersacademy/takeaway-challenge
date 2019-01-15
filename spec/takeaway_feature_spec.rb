require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'should show a list of dishes with prices' do
    menu = ""
    expect(subject.menu).to eq(menu)
  end


end
