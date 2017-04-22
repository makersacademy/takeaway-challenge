require 'list_item.rb'

describe ListItem do
  context 'it has just been initialized' do
    let(:list_item) { ListItem.new({name: "Chocolate", price: 3})}
    it 'has correct attributes' do
      expect(list_item).to have_attributes(name: "Chocolate", price: 3)
    end
  end
end
