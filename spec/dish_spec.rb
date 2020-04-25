require 'dish'

context Dish do

  describe '.new' do
    it "takes three arguments" do
      expect(Dish).to respond_to(:new).with(3).arguments
    end
  end

end
