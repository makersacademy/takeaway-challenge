
require 'menu'
require 'json'

describe Menu do
  let (:thing) { Menu.new}
  context ' toolbelt ' do
    it 'should be able to hold the dishes available' do
      expect(thing).to respond_to(:specials)
    end
  end
  context ' parsing JSON: ' do
    it 'should be able to write the menu' do
      expect(thing.specials.length).not_to eq 0
    end
  end
  context 'viewing menu: ' do
    it 'should be able to show you the menu in a readable way' do
      expect { thing.view_menu }.to output.to_stdout
    end
    it 'should be able to store the menu' do
      expect(thing.specials).to be
    end
  end
end
