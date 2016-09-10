doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/m/the_martian/"))
doc.css('script').remove
doc.at("//h1").text.strip
doc.at_css('span.meter-value').text[0, doc.at_css('span.meter-value').text.index('%')]
doc.at_css('#movie-image-section img')['src']
doc.at_css("div.info > div:nth-child(2)").text
doc.at_css("div.info > div:nth-child(6)").text.strip
doc.at_css("div.info > div:nth-child(4)").text.strip
doc.at_css("div.info > div:nth-child(14)").text.strip
doc.css('#movieSynopsis').text.strip

doc.search("span.meter-value").count
doc.search("span.meter-value").first
doc.search("span.meter-value")[1]
doc.at_css('span.meter-value').text[0, 2]
