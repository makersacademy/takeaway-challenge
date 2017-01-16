#spec file for dish class

require './lib/dish'
describe Dish do
  subject(:dish){described_class.new("Soup", 2.00)}

  describe "#new" do
    it 'successfully assigns description which can be read' do
      expect(dish.description).to eq "Soup"
    end
    it 'successfully assigns price which can be read' do
      expect(dish.price).to eq 2.00
    end
  end
end
