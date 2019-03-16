require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new }
  it 'shows a list of dishes' do
    expect { menu.show_dishes }.not_to raise_error
  end
end