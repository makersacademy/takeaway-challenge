require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#contents' do
    it '1. is a hash' do
      expect(menu.contents).to be_a(Hash)
    end

    it '2. contents of menu can be reviewed ' do
      expect(menu.contents).to include(:beef_shindaloo => 11)
    end
  end

end
