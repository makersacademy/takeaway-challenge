require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:items) { [{ "Margherita" => "£8" }, { "Roasted Vegetable" => "£9" }, { "Chorizo" => "£12" }] }

  describe '#show' do
    it 'should show a list of dishes with prices' do
      expect(menu.show(items)).to eq items
    end
  end
end
