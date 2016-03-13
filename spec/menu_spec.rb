require 'menu'

describe Menu do



  it{is_expected.to respond_to (:list)}


  describe '#initialize' do
    it 'initializes with a menu array' do
      menu = Menu.new
      expect(menu.list).to be_an Array
    end

    it 'contains information on food and prices' do
      menu = Menu.new
      expect(menu.list).to include Array
    end
  end
end
