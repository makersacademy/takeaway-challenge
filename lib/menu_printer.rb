module MenuPrinter
  def self.see dishes
    dishes.map(&:readable).join("\n")
  end
end
