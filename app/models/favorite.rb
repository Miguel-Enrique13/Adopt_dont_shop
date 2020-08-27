class Favorite
  attr_reader :content
  def initialize(content)
    @content = content || []
  end

  def add_favorite(pet)
    @content << pet unless check(pet)
  end

  def check(pet)
    @content.any? { |favorite| favorite == pet }
  end

end
