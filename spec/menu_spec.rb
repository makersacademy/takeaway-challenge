require 'menu'

describe Menu do

  include Menu

  describe '#read_menu' do
    it "Should return the full menu with prices" do
      expect(read_menu).to be_a(Hash)
    end
  end

end
