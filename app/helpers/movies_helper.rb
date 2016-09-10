module MoviesHelper
  def trunc(text, length = 30)
    truncate(text, length: length)
  end
end
