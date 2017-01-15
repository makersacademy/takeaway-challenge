require 'menu'

describe Menu do
  dishes = {"Crab" => 8.50, "Curry" => 9,"Soup" => 10.32, "Sandwich" => 12, "Steak" => 20}

  it {is_expected.to respond_to(:dishes)}

  describe "#dishes" do
    it 'should return dishes' do
      expect(subject.dishes).to eq dishes
   end
  end
end
