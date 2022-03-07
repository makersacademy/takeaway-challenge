require 'menu'
context 'menu tests' do
  let(:fake_food) { double("fake_food") }
  describe Menu do

    it 'starts with a blank menu' do
      expect(subject.items).to eq []
    end

    it 'adds a new food to the menu' do
      allow(subject).to receive(:new_food).and_return fake_food
      subject.add_item('chicken', 5.00)
      expect(subject.items).to eq [fake_food]
    end
  end
end
