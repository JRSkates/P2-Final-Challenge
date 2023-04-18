class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @word_count = contents.split(" ").length
  end
  
  def show_entry
    [@title, @contents]
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def word_count
    @contents.split(" ").size
  end
end