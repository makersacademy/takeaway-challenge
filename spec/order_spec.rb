require 'order'

describe Order do
  it 'should add dishes when add_items is run' do
    dish1 = double("dish")
    subject.add_dishes(dish1, 3)
    expect(subject.dishes).to eql([{:dish => dish1, :qty => 3}])
  end
end