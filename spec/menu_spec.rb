require 'Menu'

describe Menu do
  #Unit Test 1
  describe '#add' do
    it 'enables Chef to add items to menu 'do
    menu = Menu.new
    menu.add("salad",10)
    expect(menu.list).to eq [{ "salad" => 10 }]
    end
  end
end
