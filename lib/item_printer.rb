module ItemPrinter
  def self.to_string(object, index)
    str = "#{index}. "
    str << object.map { |_key, value| "#{value}          " }.join
  end
end
