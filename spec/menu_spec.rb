require './lib/menu'
describe Menu do
    it 'expects menu to respeond to food, drinks and desert' do
    menu = Menu.new
    expect(menu).to respond_to(:food)
    expect(menu).to respond_to(:drinks)
    expect(menu).to respond_to(:desert)
    end
end