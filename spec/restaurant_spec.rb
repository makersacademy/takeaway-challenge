require 'restaurant'

  describe Restaurant do

  subject(:restaurant) { described_class.new(menu,basket,text_provider) }
  
  let(:menu) { double :menu }
  let(:basket) { double :basket }
  let(:text_provider) { double :text_provider }
  let(:order) { double :order, :create => basket, :add => basket, :remove => basket }

  describe '#initialize' do

    it 'creates menu object' do
      expect(restaurant.menu).to eq menu
    end
    
    it 'creates basket object' do
      expect(restaurant.basket).to eq basket
    end

    it 'creates text_provider object' do
      expect(restaurant.text_provider).to eq text_provider
    end
  end

  describe '#create_order' do
    it 'creates new order with items added to empty basket' do
      expect(restaurant.create_order("peking duck",1,basket,order)).to eq basket
    end
  end

  describe '#add_to_order' do
    it 'adds items to existing order' do
      expect(restaurant.add_to_order("peking duck",1,basket,order)).to eq basket
    end
  end

  describe '#remove_from_order' do
    it 'removes items from existing order' do
      expect(restaurant.remove_from_order("peking duck",1,basket,order)).to eq basket
    end
  end

end
