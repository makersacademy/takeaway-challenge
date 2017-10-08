require './lib/object_list_printer'

describe ObjectListPrinter do
  describe 'printing a list of objects' do
    let(:object_printer_module) { double(:object_printer_module) }
    let(:objects) { [double(:object1), double(:object2)] }

    it 'sends each object to the object_printer' do
      expect(object_printer_module)
          .to receive(:to_string).with(objects[0], 1)
      expect(object_printer_module)
          .to receive(:to_string).with(objects[1], 2)

      described_class.to_string(objects, object_printer_module)
    end

    it 'separates object_printer output onto separate lines' do
      allow(object_printer_module)
          .to receive(:to_string).and_return('a object')

      expect(described_class.to_string(objects, object_printer_module))
          .to eq("a object\na object")
    end
  end
end
