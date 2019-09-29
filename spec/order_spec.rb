require 'order'

describe Order do

  let(:menu){ double :menu, all_dishes: [{chicken_korma: 12}, {cajun_pasta: 8}, {duck_chowmein: 9}, {fosters: 2}] }

  subject(:subject){described_class.new(menu)}

  describe '#add' do

    it 'responds to add' do
      expect(subject).to respond_to(:add).with(1).argument
    end

    it 'should add an item to the basket' do
      subject.add("fosters")
      expect(subject.basket).to eq([fosters: 2])
    end

  end

end
