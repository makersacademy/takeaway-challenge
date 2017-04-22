require 'menu'

describe 'menu' do
  subject {Menu.new}
  describe '#menu' do
    it 'expects menu to respond to starters' do
    expect(subject).to respond_to(:starters)
    end
  end

end
