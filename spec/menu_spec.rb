require 'menu'

  include Menu

  describe '#menu_list' do
    it "Should have access to dishes and prices" do
      expect(menu_list).to be_a(Hash)
    end
  end
