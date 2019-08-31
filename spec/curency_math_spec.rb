require './lib/currency_math'

describe 'Currency Math' do
  class MathTest; include CurrencyMath; end
  subject { MathTest.new }

  def self.this(should:, two_numbers:, making:)
    it "should #{should} #{two_numbers} and return #{making}" do
      expect(subject.send(should, two_numbers[0], two_numbers[-1])).to eq making
    end
  end

  this should: 'multiply', two_numbers: [3.55, 2],     making: '7.10'
  this should: 'multiply', two_numbers: %w(3.55 2),    making: '7.10'

  this should: 'add',      two_numbers: [3.29, 1.20],  making: '4.49'
  this should: 'add',      two_numbers: %w(3.29 1.20), making: '4.49'

  this should: 'subtract', two_numbers: [3.29, 1.20],  making: '2.09'
  this should: 'subtract', two_numbers: %w(3.29 1.20), making: '2.09'
end