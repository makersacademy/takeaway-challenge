
require "takeaway"

describe Takeaway do
subject(:takeaway) { described_class.new(menu: menu) }

let (:menu){ double(:menu, print: printed_menu) }
let(:printed_menu) {"Edamame: £2.45"}

it 'menu shows a list of dishes with their prices' do
  expect(takeaway.print_menu).to eq(printed_menu)
end

end
