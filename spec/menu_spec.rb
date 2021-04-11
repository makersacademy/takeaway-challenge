require 'menu'

describe Menu do
  subject(:menu) { described_class.new(items) }
  let(:items) { { :"Chicken Katsu" => 10, Chips: 2 } }

  context '#display_menu' do

    it 'should store a menu' do
      expect(menu.items).to eq(items)
    end

    it 'should display a menu' do
      expect(menu.display).to eq("Chicken Katsu: £10, Chips: £2")
    end
  end
end
