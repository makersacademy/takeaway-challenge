require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  describe '#list' do

    it 'should list the dishes available' do
      expect(menu.list).to eq 'Spring Rolls => £2 Egg Fried Rice => £3 Won Ton Soup => £6'
    end
  end

end