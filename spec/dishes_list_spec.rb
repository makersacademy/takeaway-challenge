require 'dishes_list'

describe DishesList do
  subject(:dishes) {described_class.new}
  let (:dish) {double :dish}

  it 'contains a list of dishes' do
    dishes.list << dish
    expect(dishes.list).to include dish
  end

end
