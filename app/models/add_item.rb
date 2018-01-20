class AddMovie

  attr_reader :id, :title, :genre

  def initialize(id, title, genre)
    @id    = id
    @title = title
    @genre = genre
  end
end
