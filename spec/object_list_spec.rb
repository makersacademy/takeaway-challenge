require './lib/object_list'

describe ObjectList do
  let(:object) { double(:object1) }

  let(:object_1) { double :object_1, name: 'Test Object 1', description: 'Test object 1 description', price: 10.95 }
  let(:object_2) { double :object_2, name: 'Test Object 2', description: 'Test object 2 description', price: 5.99 }
  let(:object_3) { double :object_3, name: 'Test Object 3', description: 'Test object 3 description', price: 2.50 }
  let(:object_4) { double :object_4, name: 'Test Object 4', description: 'Test object 4 description', price: 12.00 }

  subject(:list_empty) { described_class.new([]) }
  subject(:list_object_1) { described_class.new([object_1]) }

  describe '#initialize' do
    it 'creates a list with no objects' do
      expect(list_empty.get(0)).to be_nil
    end
  end

  context '#add' do
    it 'should add a object to objects array' do
      expect { list_empty.add object_1 }.to change { list_empty.objects }.by [object_1]
    end

    context 'raise_error' do
      it 'should raise_error if object already in list' do
        expect { list_object_1.add(object_1) }.to raise_error 'Already exists in list'
      end
    end
  end

  context '#remove' do
    it 'should remove a object from the objects array' do
      list_object_1.remove(object_1)
      expect(list_object_1.objects).not_to include object_1
    end

    context 'raise_error' do
      it 'should raise_error if object not found' do
        expect { list_empty.remove(object_1) }.to raise_error 'Not found in list'
      end
    end
  end

  describe 'showing objects as a string' do
    let(:object_list_printer_module) { double(:object_list_printer_module) }

    it 'passes all objects as printer and returns result' do
      list_empty.add('say hi')
      list_empty.add('say howdy')
      list_empty.add('say yo')
      objects = ['say hi', 'say howdy', 'say yo']

      expect(object_list_printer_module)
          .to receive(:to_string).with(objects)

      list_empty.to_string(object_list_printer_module)
    end
  end

  describe 'get object' do
    it 'gets object at index' do
      list_empty.add(['say hi'])
      expect(list_empty.get(0)).to_not be_nil
    end
  end
end
