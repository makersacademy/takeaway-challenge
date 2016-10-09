require 'menu'

describe Menu do
    let(:biscottini) {Dish.new("Biscottini", 4)}
    let(:penne) {Dish.new("Penne con la sabbia", 3)}

    describe "#entry" do
      it 'should add the dish to the menu' do
        subject.entry(penne)
        subject.entry(biscottini)
        expect(subject.menu).to include({dish: "Penne con la sabbia", price: 3})
      end
    end

end
