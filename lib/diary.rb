class Diary
  def initialize
    @entry_list = []
  end
  
  def add(entry) # entry is an instance of DiaryEntry
    @entry_list << entry
  end
  
  def list_entries
    @entry_list
  end
  
  def list_specific_entries(wpm, time)
    fail "WPM and Minutes must be an integer" unless wpm.is_a?(Integer) && time.is_a?(Integer)
    words_read = wpm * time
    readable_entires = []
    @entry_list.select { |entry| readable_entires << entry if entry.word_count <= words_read }
  end
  
  def list_phone_numbers
    phonebook = PhoneBook.new
    return phonebook.extract_numbers(@entry_list)
  end
end