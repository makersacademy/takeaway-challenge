require 'menu'

# describe Menu do
#
# #  subject(:menu) { described_class.new }
#
#   it 'will have a set of options' do
#     expect(Menu.new).to match_array['curry', 5, 'fish', 7, 'dog', 3]
# end
# end
#
# #   it 'prints the array for user' do
#     expect(Menu.new.print_menu_for_user)
#   end
# end

describe Menu do
  it 'Will exist' do
  expect(Menu.new)
end

it'will have prices' do
  expect(Menu.new).should include('fish'  )
end



it 'will be a hash'do
 menu_hash.should include(
  # "upper_left" => true,
  # "upper_right" => false,
  # "lower_left" => false,
  # "lower_right" => true
:fish)
end
end
