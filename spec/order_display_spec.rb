require 'order_display'

describe OrderDisplay do

  it '#print_order puts the argument' do
    expect { subject.print_order(hash: { abc: 123 }) }.to output(/#{123}/).to_stdout
  end

end
