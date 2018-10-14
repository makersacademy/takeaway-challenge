require 'menu_factory'

describe MenuFactory do
  let(:dish) { double :dish }
  let(:dish_class) { double :dish_class, new: dish }
  let(:file_like_object) { double :file_obj }
  let(:file_name) { 'file_name' }
  let(:hash_object) { { "main" => [{ "name" => 'item1', 'price' => 8 }] } }
  let(:category_obj) { double :category_obj, :add_dish => true }
  let(:category_class) { double :category_class, new: category_obj }
  let(:menu_obj) { double :menu_obj }
  let(:menu_class) { double :menu_class, new: menu_obj }
  subject { described_class.new(dish_class, category_class, menu_class) }

  describe '#create_menu' do
    it 'reads json file, and creates an array of dish objects from it' do
      allow(File).to receive(:read).with(file_name).and_return(file_like_object)
      allow(JSON).to receive(:parse).with(file_like_object).and_return(hash_object)
      expect(subject).to receive(:make_objects).with(hash_object).and_return(category_obj)
      subject.create_menu(file_name)
    end
  end

  describe '#make_objects' do

    it 'creates menu from a hash' do
      expect(subject.make_objects(hash_object)).to eq(menu_obj)
    end

    it 'creates objects of the class specified in the initalize' do
      allow(dish_class).to receive(:new).and_return(dish)
      expect(category_obj).to receive(:add_dish).and_return(true)
      subject.make_objects(hash_object)
    end
  end
end
