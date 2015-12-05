class Takeaway

  def show_dishes
    print "starter : 5\nmains : 10\ndesert : 3\n"
  end

  def order(*dishes)
    dishes.pop

  end

end
