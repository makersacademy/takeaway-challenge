require './lib/print'

describe Print do
  alias_method :print, :subject

  it 'creates instance of Print class' do
    expect(print).to eq(print)
  end
  
end
