require 'menu'

describe Menu do
  let (:dish_1) {double (:dish)}
  def add_ramen
    ramen = double("Dish", :name => "Ramen Noodles", :price => 4.99)
    subject.add(ramen)
    return ramen
  end
  context 'defaults' do

    it 'has an empty hash of dishes by defualt' do
      expect(subject.dishes).to eq({}) 
    end
  end
  
  context 'menu management' do
    it 'adds a dish' do
      ramen = add_ramen
      expect(subject.dishes).to include(ramen.name)
    end

    it 'removes a dish' do
      ramen = add_ramen
      subject.remove(ramen)
      expect(subject.dishes).not_to include(ramen.name)
    end

    it 'has a hash of dishes' do
      ramen = add_ramen
      expect(subject.menu).to include(ramen.name)
    end

    it 'checks if a dish is on the menu' do
      ramen = add_ramen
      gyoza = double("Dish", :name => "Chicken Gyoza", :price => 4.99)
      expect(subject.available?(gyoza)).to eq(false)
    end

    it "responds to show_dishes" do
      expect(subject).to respond_to(:show_dishes)
    end
  end
end