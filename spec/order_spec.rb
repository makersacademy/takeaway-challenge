require 'order'
require 'menu'
describe Order do

  describe '#add_dish' do
    #allow(subject).to receive(:add_dish).with(1, 2)

    it "return the list of the added item" do
      actual = subject.add_dish(1, 2)
      expected = { "prawn crackers" => [1.99, 2] }
      expect(actual).to eq expected
    end

  end

end
