require 'menu.rb'

RSpec.describe Menu do
  let(:subject){ Menu.new }
  let(:dishes){[
    { name: "pizza", price: 9.99 },
    { name: "calzone", price: 11.50 },
    { name: "kebab", price: 4.99 },
    { name: "soup", price: 5.50 },
    { name: "sandwich", price: 3.50 },
    { name: "garlic bread", price: 3.99 }
  ]}
  it 'initializes a list of #dishes' do
    expect(subject.dishes).not_to be_empty
  end

end
