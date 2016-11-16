require 'open-uri'

class Scrapper < ServiceBase
  # attr_accessor :madyness_rss

  def initialize
    @mansion_ingles = 'http://www.mansioningles.com/gram53.htm'
  end

  def run
    parsing(@mansion_ingles)
  end

  private

  def parsing(website)

    html_file = open(webiste)
    html_doc = Nokogiri::HTML(html_file)
    list_of_verbs = []

    html_doc.search('td[bgcolor] > p').each do |element|
      list_of_verbs << element.text.strip
    end

    ## Removing noises
    (0..6).each do |i|
      i = 0
      list_of_verbs.delete_at(i)
      i += 1
    end

    list_of_verbs.each do |verb|

      verb_data = {
       infinitive: verb,
       simple_past: verb,
       past_participle: verb,
       translation: verb,
      }

      p Verb.find_or_create_by(verb_data)
    end

  end

end
