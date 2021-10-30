require './lib/menu'
describe Menu do
    it 'expects menu to respeond to food' do
    menu = Menu.new
    expect(menu).to respond_to(:food)
    end
end

