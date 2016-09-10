class Scrape
  attr_accessor :title, :hotness, :image_url, :rating, :director, :genre, :runtime, :synopsis, :failure

  def scrape_new_movie(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('script').remove

    self.title = doc.at('//h1').text.strip
    self.hotness = doc.at_css('span.meter-value').text[0, doc.at_css('span.meter-value').text.index('%')]
    self.image_url = doc.at_css('#movie-image-section img')['src']
    self.rating = doc.at_css('div.info > div:nth-child(2)').text
    self.director = doc.at_css('div.info > div:nth-child(6)').text.strip
    self.genre = doc.at_css('div.info > div:nth-child(4)').text.strip
    self.runtime = doc.at_css('div.info > div:nth-child(12)').text.strip
    s = doc.css('#movieSynopsis').text.strip
    self.synopsis = s.encode('UTF-16be', invalid: :replace, replace: '?').encode('UTF-8') if s.valid_encoding?
    return true
  rescue StandardError => e
    self.failure = 'Something went wrong with the scrape! '
  end
end
