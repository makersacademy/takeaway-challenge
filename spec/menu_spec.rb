require 'menu'

describe Menu do

  subject { described_class.new }

  it 'displays list of dishes to user' do
    expect(subject.display_menu).to eq("burger - 9, fries - 3, sandwich - 6")
  end

  # it 'tells you the price of 1 dish' do
  #   expect(subject.check_price(:burger)).to eq(9)
  # end

end
