require "order.rb"

describe Order do

  describe "#initialize" do
    it "creates an instance of a order" do
      expect(subject).to be_an_instance_of(Order)
    end
    it "creates a list on initialize" do
      expect(subject.list).to eq([])
    end
  end

  describe '#read menu' do
    it 'returns the menu' do
      expect(subject).to respond_to(:read_menu)
    end
  end

  describe '#add' do
    it 'responds to add with one argument' do
      expect(subject).to respond_to(:add).with(1).argument
    end
    it 'adds an item to the order' do
      subject.add(1)
      expect(subject.list.count).to eq(1)
    end
    it 'adds the correct item to the order' do
      subject.add(1)
      expect(subject.list[0]).to eq(MENU.list[0])
    end
  end

  describe '#remove' do
    it 'responds to remove with one argument' do
      expect(subject).to respond_to(:remove).with(1).argument
    end
    it 'takes an item off the order' do
      subject.add(1)
      subject.remove(1)
      expect(subject.list).to eq([])
    end
    it 'takes the correct item off the order' do
      subject.add(1)
      subject.add(2)
      subject.remove(2)
      expect(subject.list[0]).to eq(MENU.list[0])
    end
  end
  describe '#total' do
    it 'responds to total' do
      expect(subject).to respond_to(:remove)
    end
    it 'gives the total of the order' do
      subject.add(1)
      expect(subject.total).to eq(5.2)
    end
  end

  describe '#submit' do
    it 'responds to submit' do
      expect(subject).to respond_to(:submit)
    end
    it 'gives submit as true' do
      subject.submit
      expect(subject.submitted).to eq(true)
    end
  end

  describe '#list_order' do
  it 'responds to list order' do
    expect(subject).to respond_to(:list_order)
  end
  it 'gives list' do
    subject.add(1)
    expect(subject.list_order.class).to eq(String)
  end
end

end