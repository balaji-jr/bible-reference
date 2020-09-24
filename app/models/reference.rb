class Reference < ApplicationRecord
  has_one :verse
  def self.parse_reference(ref)
    book_name = ref.gsub(/([\d]?\s?\w+)\s(\d+):((\d+)[-]?(\d+)?)/, '\1')
    chapter_no = ref.gsub(/([\d]?\s?\w+)\s(\d+):((\d+)[-]?(\d+)?)/, '\2').to_i
    verse = ref.gsub(/([\d]?\s?\w+)\s(\d+):((\d+)[-]?(\d+)?)/, '\3')
    verse_from = verse.gsub(/(\d+)-(\d+)/, '\1').to_i
    verse_to = verse.gsub(/(\d+)-(\d+)/, '\2').to_i
    verses = [*verse_from..verse_to]
    current_ref = {}
    current_ref[:book_name] = book_name
    current_ref[:chapter_no] = chapter_no
    current_ref[:verses] = verses
    current_ref
  end
end
