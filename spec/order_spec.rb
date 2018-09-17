require './lib/order'
require './lib/menu'

describe Order do
  let(:takeaway)  { described_class.new }

  describe '#show_menu' do

    it 'shows a list of the menu' do
      expect(takeaway.list_menu).to eq (takeaway.menu)
    end
  #
  describe '#choose items' do

    it 'adds an item to the order' do
      item = :egg_fried_rice
      takeaway.choose_item(item)
      expect(takeaway.order).to eq [item]
    end

    it 'raises an error if item is not on the menu' do
      item = :kung_pao_chicken
      expect{ takeaway.choose_item(item) }.to raise_error "Sorry, this item is unavailable here!"
    end
  end

  describe '#calculate sum' do
    it 'adds the sum of one item' do
      item = :egg_fried_rice
      takeaway.choose_item(item)
      expect(takeaway.calculate_sum).to eq 2
    end

    it 'adds the sum of multiple items' do
      item = :egg_fried_rice
      item1 = :quarter_aromatic_crispy_duck
      item2 = :full_aromatic_crispy_duck
      takeaway.choose_item(item)
      takeaway.choose_item(item1)
      takeaway.choose_item(item2)
      expect(takeaway.calculate_sum).to eq 39
    end
  end

  end
end
