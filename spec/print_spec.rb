require './lib/print'

describe Print do
  alias_method :print, :subject

  it 'creates instance of Print class' do
    expect(print).to eq(print)
  end

  it { is_expected.to respond_to(:print_dishes) }

end
