require 'restaurant'

describe Restaurant do
  it { expect(subject).to respond_to :show_menu }

end
