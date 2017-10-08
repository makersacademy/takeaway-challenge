require './lib/object_list'

describe ObjectList do
  let(:objects) { [double(:object1), double(:object2)] }

  describe '#initialize' do
    it 'creates a list with no objects' do
      expect(subject.get(0)).to be_nil
    end
  end

  describe 'adding objects' do
    it 'stores objects in the objects array' do
      subject.add(objects)
      expect(subject.objects).to eq(objects)
    end
  end

  describe 'showing objects as a string' do
    let(:object_list_printer_module) { double(:object_list_printer_module) }

    it 'passes all objects as printer and returns result' do
      subject.add(['say hi', 'say howdy', 'say yo'])
      objects = ['say hi', 'say howdy', 'say yo']

      expect(object_list_printer_module)
          .to receive(:to_string).with(objects)

      subject.to_string(object_list_printer_module)
    end
  end

  describe 'get object' do
    it 'gets object at index' do
      subject.add(['say hi'])
      expect(subject.get(0)).to_not be_nil
    end
  end
end
