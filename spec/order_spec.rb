require 'order'

describe Order do
  let(:order1) {double :order, status: "Checking sum", sum: 36, list: [["chicken",1],["spinach",3],["potatoes",2]]}

  describe "initilize" do

    it 'should start with an empty a list of ordered dishes' do
      expect(subject.list).to eq []
    end

    it 'should set the initial sum of the order to 0' do
      expect(subject.sum).to eq 0
    end

    it 'should set the initial status of the order to nil' do
      expect(subject.status).to eq nil
    end

  end

  describe "start_order" do

    it 'should store a list of items ordered in order_list' do
      subject.start_order(order1)
      expect(subject.list).to eq order1.list
    end

    it 'should store a sum in the sum variable' do
      subject.start_order(order1)
      expect(subject.sum).to eq 36
    end

  end

  describe "confirm_order" do

    it 'should set status to confirmed' do
      subject.confirm(order1)
      expect(subject.status).to eq "Confirmed"
    end
  end

end
