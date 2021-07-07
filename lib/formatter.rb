class Formatter

  def price(number)
    return format("£%<number>.2f", number: number)
  end
end
