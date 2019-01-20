require 'menu'

RSpec.describe Menu do

  it 'prints menu so customer can order food' do
    expect(subject.print).to eq(subject.menu_items)
  end

end


