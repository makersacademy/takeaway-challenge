require 'menu'

describe Menu do
  context 'initializing' do
    it "initializes with menu" do
      new_menu = Menu.new
      expect(new_menu).to respond_to(:take_away_menu)
    end
  end
end
