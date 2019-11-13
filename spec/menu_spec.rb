require 'menu'
describe Menu do
  it 'creates instance' do
    menu = Menu.new
  expect(menu).to be_instance_of(Menu)
  end

   it 'shows dishes and prices' do
     menu = Menu.new
   expect(menu.food_list).to eq(:chips => 1.5, :chicken => 5.25)
   end
end
   #
  #expect(hashes.any? { |hash| hash['foo'] == '2' }).to be_true
  # expect(order.price_list).to
  # end

  # it "transforming something does something" do
  #   base_data = { k1: 1, k2: 2 }
  #   transformed_data = base_data.each_with_object({}) { |(k, v), t|
  #     t[k] = f(v)
  #   }
  #
  #   expect(transformed_data).to eq(
  #     k1: 2,
  #     k2: 4,
  #   )
  # end
