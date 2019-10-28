require 'menu'

describe Menu do
  let(:dish_1) { double :dish }

  def add_ramen
    ramen = double("Dish", :name => "Ramen Noodles", :price => 4.99)
    subject.add(ramen)
    return ramen
  end

  context 'defaults' do

    it 'has an empty array of dishes by defualt' do
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
      expect(subject.available?("Ramen Noodles")).to eq(true)
    end
  end

  context "printing" do
    it "shows a list of available dishes" do
      add_ramen
      expect { subject.show_dishes }.to output("Ramen Noodles : 4.99\n").to_stdout
    end
  end
end
