require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  describe '#view menu' do
    it 'shows the menu' do
      expect(menu.view).to be_a(Hash)
    end
  end

  describe '#select' do
    let(:meals) {  { "pizza" => 7} }
    it 'selects a dish' do
      expect(menu.select("pizza")).to eq ["pizza"]
    end
  end

  
end