require 'menu'

describe Menu do
  describe 'display' do
    specify { expect { subject.display }.to output("1. Burger £4\n2. Chips £2\n3. Pizza £7\n4. Burrito £6\n5. Salad £6\n6. Lobster £15\n7. Sirloin Steak £18\n").to_stdout }
  end
end
