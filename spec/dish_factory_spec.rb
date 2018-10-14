require 'dish_factory'

describe DishFactory do
  let(:dish) { double :dish }
  let(:dish_class) { double :dish_class, new: dish }
  let(:file_like_object) { double :file_obj }
  let(:file_name) { 'file_name' }
  let(:array_object) { [{ "name" => 'item1', 'price' => 8, 'type' => :main }] }
  subject { described_class.new(dish_class) }

  describe '#create_dishes' do
    it 'reads json file, and creates a hash from it' do
      allow(File).to receive(:read).with(file_name).and_return(file_like_object)
      allow(JSON).to receive(:parse).with(file_like_object).and_return(array_object)
      expect(subject).to receive(:make_objects).with(array_object).and_return([dish])
      subject.create_dishes(file_name)
    end
  end

  describe '#make_objects' do

    it 'creates object from an array' do
      expect(subject.make_objects(array_object)).to eq [dish]
    end
  end
end
