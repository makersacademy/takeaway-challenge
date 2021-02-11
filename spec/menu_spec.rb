require 'menu'

describe Menu do

  it 'should show a menu list' do
  expect(subject.list).to eq [{pizza: 5}, {spaghetti: 6}, {sushi: 10}, {nachos: 8}, {burger: 7}]
end
end
