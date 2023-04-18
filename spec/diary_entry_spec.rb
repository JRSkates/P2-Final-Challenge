require 'diary_entry'

RSpec.describe "diary_entry" do
  context "When creating a new diary entry" do
    it "initializes the title and contents and returns them with show_entry" do
      entry = DiaryEntry.new("First Entry", "First Contents")
      expect(entry.show_entry).to eq ["First Entry", "First Contents"]
    end

    it "returns the title" do
      entry = DiaryEntry.new("First Entry", "First Contents")
      expect(entry.title).to eq "First Entry"
    end

    it "returns the contents" do
      entry = DiaryEntry.new("First Entry", "First Contents")
      expect(entry.contents).to eq "First Contents"
    end
  end
end