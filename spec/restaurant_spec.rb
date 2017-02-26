require 'restaurant'

describe Restaurant do
  subject(:restaurant) {described_class.new('El Sombrero')}

  describe 'initialization' do
    it 'knows its own name' do
      expect(restaurant.name).to eq 'El Sombrero'
    end

  end

  describe 'is responsible for its own menu' do

    it 'can create a menu' do
      expect(restaurant.create_menu(double :filename)).to be_an_instance_of Menu
    end

    it 'can display a menu' do
      expect(restaurant).to respond_to(:display_menu)
    end



    # let(:file){double :file}
    # it 'can read a csv file' do
    #   File.stub(:open).and_return(file)
    #
    #   # allow(file).to receive(:open).and_return(file)
    #   expect(restaurant.display_menu(file)).to eq file
    # end

  end

  describe 'is responsible for creating new orders' do

    it 'can create a new order' do
      expect(restaurant).to respond_to(:create_order)
    end

    it 'creates a new instance of an Order' do
      expect(restaurant.create_order).to be_an_instance_of Order
    end

  end

  describe 'is responsible for confirming order' do

    it 'sends a confirmation text' do
      expect(restaurant).to respond_to(:confirm)
    end

  end

end
