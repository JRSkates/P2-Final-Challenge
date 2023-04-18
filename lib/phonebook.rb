class PhoneBook
  def initialize
  end
  
  def extract_numbers(entry_list)
    numbers_list = []
    entry_list.each do |entry|
      next if !entry.is_a? DiaryEntry
      numbers = entry.contents.scan(/07+[0-9]{9}/)
      numbers_list << numbers
    end
  return numbers_list.flatten
  end
end