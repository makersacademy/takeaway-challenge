class Printer
  def self.show(input)
    input.each { |key, value| puts "#{key} — #{value}" }
  end
end
