require 'interface'

describe Interface do
  subject(:interface) {described_class.new(menu, order)}
  let(:menu) {double(:menu, show: nil)}
  let(:order) {double(:order)}
end
