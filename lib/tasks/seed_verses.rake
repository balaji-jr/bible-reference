desc 'Seed Verses'
task seed_verses: :environment do
  doc = File.open("#{Dir.home}/nkjv.xml") { |f| Nokogiri::XML(f) }
  books = doc.xpath('//b')
  books.map do |book_node|
    book_name = book_node['n']
    chapters = book_node.css('c')
    chapters.map do |chap|
      chapter_no = chap['n']
      verses = chap.css('v')
      verses.map do |verse|
        verse_no = verse['n']
        verse_text = verse.text
        reference = Reference.find_or_create_by(book_name: book_name, chapter_no: chapter_no, verse_no: verse_no)
        current_verse = Verse.find_or_create_by(verse: verse_text, reference: reference)
        print "#{current_verse.id} + "
      end
    end
  end
end
