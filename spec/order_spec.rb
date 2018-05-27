require 'order'
describe Order do

  describe '#add' do
    it 'can add to the order' do
      subject.add([["chicken", "10"], ["rice", "10"]])
      expect(subject.items).to eq({ "chicken" => 1, "rice" => 1 })
      expect(subject.total).to eq 20
    end
  end
end
