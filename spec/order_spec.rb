require 'order'

describe Order do

    it 'can select a number of dishes' do
      subject.place("Chicken", 2)
      subject.place("Fish", 3)
      expect(subject.list).to eq [{dish_selection: "Chicken", quantity: 2}, {dish_selection: "Fish", quantity: 3}]
    end
    #
    it 'calculates the total price for the order' do
      subject.place("Chicken", 2)
      subject.place("Lamb", 2)
      expect(subject.total).to eq 22
    end
end
