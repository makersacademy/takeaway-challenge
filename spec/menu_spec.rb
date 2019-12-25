require 'menu'

describe Menu do

  let(:dish_example) { {number: 1, dish: 'Chicken Biryani', price: 8.99} }

  describe '#list_dishes' do
    it "should show the available dishes in the menu" do
      expect(subject.list_dishes).to include dish_example
    end
  end
end
