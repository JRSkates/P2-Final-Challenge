require 'diary_entry'
require 'diary'

RSpec.describe 'Diary Integration' do
  context 'with multiple diary entries' do
    it 'lists all diary entries' do
      diary = Diary.new
      entry_1 = DiaryEntry.new("First Title", "First Contents")
      entry_2 = DiaryEntry.new("Second Title", "Second Contents Second")
      entry_3 = DiaryEntry.new("Third Title", "Third Contents Third Contents")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.list_entries).to eq([entry_1, entry_2, entry_3])
    end
  end

  context 'listing specific entries based on wpm and minutes' do
    it 'fails if wpm is not an integer' do
      diary = Diary.new
      entry_1 = DiaryEntry.new("First Title", "First Contents")
      entry_2 = DiaryEntry.new("Second Title", "Second Contents Second")
      entry_3 = DiaryEntry.new("Third Title", "Third Contents Third Contents")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect {diary.list_specific_entries('one', 2)}.to raise_error "WPM and Minutes must be an integer"
    end

    it 'fails if minutes is not an integer' do
      diary = Diary.new
      entry_1 = DiaryEntry.new("First Title", "First Contents")
      entry_2 = DiaryEntry.new("Second Title", "Second Contents Second")
      entry_3 = DiaryEntry.new("Third Title", "Third Contents Third Contents")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect {diary.list_specific_entries(1, 'two')}.to raise_error "WPM and Minutes must be an integer"
    end

    it 'returns two word entry when the wpm is 1 and the minutes is 2' do
      diary = Diary.new
      entry_1 = DiaryEntry.new("First Title", "First Contents")
      entry_2 = DiaryEntry.new("Second Title", "Second Contents Second")
      entry_3 = DiaryEntry.new("Third Title", "Third Contents Third Contents")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.list_specific_entries(1, 2)).to eq([entry_1])
    end

    it "returns three word and two word entry when the wpm is 1 and the minutes is 3" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("First Title", "First Contents")
      entry_2 = DiaryEntry.new("Second Title", "Second Contents Second")
      entry_3 = DiaryEntry.new("Third Title", "Third Contents Third Contents")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.list_specific_entries(1, 3)).to eq([entry_1, entry_2])
    end

    it "extracts phone numbers from entries and returns them" do
      diary = Diary.new
      entry = DiaryEntry.new("First Title", "First 07986746537 Contents")
      diary.add(entry)
      expect(diary.list_phone_numbers)
    end

    it "extracts multiple phone numbers from entries and returns them" do
      diary = Diary.new
      entry = DiaryEntry.new("First Title", "First 07986746537 Contents")
      entry_2 = DiaryEntry.new("Second Title", "Second 07564372837 Contents")
      diary.add(entry)
      diary.add(entry_2)
      expect(diary.list_phone_numbers).to eq(["07986746537", "07564372837"])
    end
  end
end
