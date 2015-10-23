require 'order'

describe Order do
  let(:menu) {double :menu}
  let(:menu_klass) {double :menu_klass, new: menu}
  subject(:order) {described_class.new(menu_klass: menu_klass)}
end
