# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

```
┌─────────────────────────────────┐  ┌──────────────────────┐
│Diary                            │  │TodoList              │
│ @entry_list                     │  │ @list :array         │
│                                 │  │ -add(todo) :string   │
│                                 │  │ -todos :array        |
│ -add_entry :diaryentry          |  └──────────────────────┘
│ -list_entries :array            │       ┌─────────────────┐
│ -list_specific_entries(wpm,time)│       │PhoneBook        |
|                                 |       |@contacts : array|
|                                 |       |                 |
│ -list_phone_numbers             │◄──────│ -extract_numbers│
└────────────┬────────────────────┘       └─────────────────┘
             │
             │contains a list of:
             │
┌────────────▼────────────────────┐
│DiaryEntry                       │
│ @title :string                  │
│ @contents :string               │
│ @word_count :integer            │
└─────────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    @entry_list = []
  end

  def add_entry(entry) # entry is an instance of DiaryEntry
    @entry_list << entry
  end

  def list_entries
    @entry_list
  end

  def list_specific_entries(wpm, time)
    readable_entires = @entry_list.select { |entry| entry.reading_time(wpm) <= minutes }
    readable_entires.sort_by { |entry| entry.reading_time(wpm) }.last
  end
end

class TodoList
  def initialize
    @list = []
  end

  def add(todo)
    fail "This task is not from the Todo class" unless todo.is_a?(String)
    @list << todo
  end

  def todos
    @list
  end
end

class PhoneBook
  def initialize
    @contacts = []
  end

  def extract_numbers

  end
end

class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @word_count = contents.split(" ").length
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
