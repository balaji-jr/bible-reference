class ScripturesController < ApplicationController
  def index
    reference = params[:ref]
    current_ref = Reference.parse_reference(reference)
    verses = []
    current_ref[:verses].map do |verse|
      verse_text = Verse.find_by(reference: Reference.find_by(book_name: current_ref[:book_name], chapter_no: current_ref[:chapter_no], verse_no: verse))
      result_hash = {}
      result_hash[:book_name] = current_ref[:book_name]
      result_hash[:chapter_no] = current_ref[:chapter_no]
      result_hash[:verse] = verse
      result_hash[:text] = verse_text.verse
      verses.push(result_hash)
    end
    render json: verses
  end
end
