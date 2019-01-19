require 'calculate'

RSpec.describe Calculate do
  describe '#add' do
    it "take in an array of arrays and calculates total" do
      item_1 = ["dish", 2, 10]
      item_2 = ["dish", 5, 10]
      item_3 = ["dish", 3, 10]
      expect(subject.add([item_1, item_2, item_3])).to eq(100)
    end
  end
end
