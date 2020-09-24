class ScripturesController < ApplicationController
  def index
    # scriptures = Reference.all
    # render json: scriptures
    reference = params[:ref]
    current_ref = Reference.parse_reference(reference)
    current_ref[:verses].map do |_verse|
      render json: Verse.find_by(reference: Reference.find_by(book_name: current_ref[:book_name], chapter_no: current_ref[:chapter_no], verse_no: _verse))
    end
  end

  # def show
  #   byebug
  #   grade = Grade.find(params[:id])
  #   render json: grade
  # end
end

# Verse.find_by(reference:Reference.find_by(book_name: "Genesis", chapter_no:1, verse_no:2))
