require 'menu'
require 'dish'

describe Menu do
  it 'should have an empty list of dishes when initialized' do
    expect(subject.dishes).to be_empty
  end

  describe '#print_menu' do
    it 'should print the list of dishes' do
      expect(subject.print_menu).to eq([])
    end
  end

end
