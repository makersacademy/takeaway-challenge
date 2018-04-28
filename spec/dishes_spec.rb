describe Dishes do

  let(:dishes) { Dishes.new }

  describe "#list" do

    it 'saves a list of menu items' do
      expect(dishes.list).to be_instance_of Array
    end

  end

  describe "#print" do

    it 'pretty prints the list for customer' do


    end

  end


end
