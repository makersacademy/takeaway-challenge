require 'menu'

describe Menu do

  subject { described_class.new('lib/menu.txt') }

  it 'has a list of dishes available' do
    expect(subject.show_menu).to_not be_empty
  end

  # describe 'Basket' do
  #
  #   it 'has a basket' do
  #
  #   end
  #
  # end

end
