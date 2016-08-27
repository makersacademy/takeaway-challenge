require 'order'

describe Order do

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

    before(:each) do
      @sum = 36
      @list = ["chicken",1],["spinach",3],["potatoes",2]
    end

    it 'should store a list of items ordered in list' do
      subject.start_order(@list,@sum)
      expect(subject.list).to eq [[["chicken",1],["spinach",3],["potatoes",2]]]
    end

    it 'should store a sum in the sum variable' do
      subject.start_order(@list,@sum)
      expect(subject.sum).to eq 36
    end

  end

  describe "confirm_order" do

    it 'should set status to confirmed' do
      subject.confirm_order
      expect(subject.status).to eq "Confirmed"
    end
  end

end
