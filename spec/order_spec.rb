require 'order'

describe Order do

  let(:menu){ double :menu, all_dishes: [{chicken_korma: 12}, {cajun_pasta: 8}, {duck_chowmein: 9}, {fosters: 2}] }

  subject(:subject){described_class.new(menu)}

  describe '#add' do

    it 'responds to add' do
      expect(subject).to respond_to(:add).with(2).argument
    end

    it 'should add an item to the basket' do
      subject.add("fosters", 1)
      expect(subject.basket).to eq([{fosters: 2}])
    end

    it 'should add multiple items to the basket' do
      subject.add("chicken_korma", 3)
      expect(subject.basket).to eq([{chicken_korma: 12}, {chicken_korma: 12}, {chicken_korma: 12}])
    end

  end

  describe '#total' do

    it 'should calculate the total when dishes are added to the basket' do
      subject.add("chicken_korma", 3)
      expect(subject.total).to eq 36
    end

  end

  describe '#basket_summary & #checkout'do

    it 'should return a basket message' do
      expect(subject.basket_summary).to eq("Your total for this order is £0. Please proceed to checkout.")
    end

    it 'should return an error message if checkout money is not enough' do
      subject.add("fosters", 5)
      expect(subject.checkout(3)).to eq("Please checkout with the correct amount")
    end

    it 'should confirm with checkout message' do
      subject.add("fosters", 5)
      allow(subject).to receive(:gets).and_return("Y")
      expect(subject.checkout(15)).to eq("Thank you for ordering, you will receive a text shortly")
    end

    it 'should confirm with checkout message' do
      subject.add("fosters", 5)
      allow(subject).to receive(:gets).and_return("N")
      expect(subject.checkout(15)).to eq("Please checkout again")
    end

  end

end
