require 'order'

describe Order do

  describe '#add_dish' do
  let(:dish) {double :dish}
  let(:quantity) {double :quantity}

    it 'raises an error when adding a dish not available' do
      message = 'This dish is not available'
      expect{subject.add_dish(:dish, :quantity)}.to raise_error message
    end

    it 'adds a dish and ordered quantity to the list of order' do
      subject.add_dish(:pancake, 2)
      expect(subject.list_of_order).to include(:pancake => 2)
    end

    it 'modifies the quantity on the list of order if more is added' do
      subject.add_dish(:pancake, 2)
      subject.add_dish(:pancake, 1)
      expect(subject.list_of_order).to include(:pancake => 3)
    end

    it 'informs customer that item has been added to the basket' do
      expect do
        subject.add_dish(:pancake, 2)
      end.to output("You have added 2x pancake to your basket.").to_stdout
    end
  end

end
