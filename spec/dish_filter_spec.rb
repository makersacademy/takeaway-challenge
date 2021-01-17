require 'dish_filter'

describe '#DishFilter' do
  subject { Class.new { extend DishFilter } }

  describe '#find_by_id' do
    let(:dish1) { double("dish1") }
    let(:dish2) { double("dish2") }
    let(:dishes) { [dish1, dish2] }

    before :each do
      allow(dish1).to receive(:[]).with("id").and_return(1)
      allow(dish2).to receive(:[]).with("id").and_return(2)
    end

    it 'checks if dish is returned' do
      expect(subject.find_by_id(dishes, 1)).to eq dish1
    end

    it 'should return nil if dish is not found' do
      expect(subject.find_by_id(dishes, 3)).to eq nil
    end
      
  end

end
