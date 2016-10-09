require 'order'

describe Order do
  let(:biscottini) {Dish.new("Biscottini", 4)}
  let(:penne) {Dish.new("Penne con la sabbia", 3)}

  it "should store the item in the order class" do
    subject.add(penne)
    subject.add(biscottini)
    expect(subject.order).to include({dish: "Penne con la sabbia", price: 3}, {dish: "Biscottini", price: 4})
  end

end
