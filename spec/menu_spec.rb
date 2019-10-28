require 'menu'

describe Menu do
  subject(:vietnamese_menu) { Menu.new }
  context 'receives a list of dishes with prices' do
    it 'looks at a menu' do
      output = subject.list
      expect(output).to include("Pho")
    end
  end
end
