require 'restaurant'
describe Restaurant do

  it 'has a menu' do
  restaurant = Restaurant.new
  expect(subject.menu).to_not be_empty
end

it 'should enable to select dishes' do
  restaurant = Restaurant.new
  subject.dishes_can_be_selected :Texan_BBQ, 2
  expect(subject.order).to eq [{:Texan_BBQ => 15}, {:Texan_BBQ => 15}]
end

it 'should give total amount of purchased dishes' do
  restaurant = Restaurant.new
  subject.dishes_can_be_selected :Hawaiian, 2
  expect(subject.give_total_amount).to eq 28
end

it "can text confirmation of an order" do
    allow(subject).to receive(:text_message_is_send).and_return(true)
    expect(subject.text_message_is_send).to eq true
  end

end