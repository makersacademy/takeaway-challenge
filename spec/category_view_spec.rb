require 'category_view'

describe CategoryView do
  let(:name) { 'name' }
  let(:price) { 8 }
  let(:dish) { double :dish, name: name, price: price }
  let(:dish_view) { double :dish_view, display: "dishes" }
  let(:dish_view_class) { double :dish_view_class, new: dish_view }
  let(:items) { [dish] }
  let(:category) { double :category, items: items }
  subject { described_class.new(category, dish_view_class) }

  describe "#display" do
    it "displays the items' views' in the category" do
      expect(dish_view_class).to receive(:new).with(dish).and_return(dish_view)
      subject.display
    end

    it "displays the items' views' in the category" do
      allow(dish_view_class).to receive(:new).with(dish).and_return(dish_view)
      expect(dish_view).to receive(:display)
      subject.display
    end

  end

end
