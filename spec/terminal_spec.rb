require 'Terminal'
RSpec.describe Terminal do

describe '#view_menu' do
  it {is_expected.to respond_to(:view_menu)}
end

describe '#add_to_order' do
  it {is_expected.to respond_to(:add_to_order)}
end

describe '#add_to_order' do
  it 'adds to order from terminal' do
  subject.add_to_order('lamb doner',2)
  expect(subject.order.cart).to eq ['lamb doner', 'lamb doner']
end
end

describe '#delete_from_order' do
  it 'deletes an item from the order cart' do
    subject.add_to_order('lamb doner', 3)
    subject.delete_from_order('lamb doner', 2)
    expect(subject.order.cart).to eq ['lamb doner']
  end
end

describe '#outstanding_balance' do
  it 'is expected to display the balance for order' do
    subject.add_to_order('lamb doner', 2)
    subject.add_to_order('half pounder', 1)

    expect(subject.outstanding_balance).to eq 'total order: £14'
end

end
end
