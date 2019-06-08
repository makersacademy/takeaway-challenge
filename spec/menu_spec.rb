require 'menu'

describe Menu do
  
  before(:each) do
    @dish_double = double('dish', name: 'Yummy', price: 9.99)
    @dish_double2 = double('dish2', name: 'Scrummy', price: 5.99)
    @dish_class_double = double('dish_class')
    @dish_class_double2 = double('dish_class2')
    allow(@dish_class_double).to receive(:new).with('Yummy', 9.99).and_return(@dish_double)
    allow(@dish_class_double2).to receive(:new).with('Scrummy', 5.99).and_return(@dish_double2)
    @menu = Menu.new
  end
  
  describe '#initialised' do

    it 'is initialised with an empty array' do
      expect(@menu.get(0)).to be_nil
    end
  end

  describe '#add' do
    it 'adds a dish to the menu' do
      @menu.add('Yummy', 9.99, @dish_class_double)
      expect(@menu.get(:Yummy)).to eq(@dish_double)
    end
  end

  describe '#print' do
    it 'displays the menu contents' do
      @menu.add('Yummy', 9.99)
      expect(@menu.print).to eq("Yummy 9.99")
    end
  end

  describe '#get_dish_by_name' do
    it 'gets the dish by searching for the name' do
      @menu.add('Yummy', 9.99, @dish_class_double)
      @menu.add('Scrummy', 5.99, @dish_class_double2)
      expect(@menu.get_dish_by_name('Scrummy')).to eq(@dish_double2)
    end
  end

end
