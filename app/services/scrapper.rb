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

  def parsing(webpage)

    html_file = open(webpage)
    html_doc = Nokogiri::HTML(html_file)
    list_of_verbs = []

    ## Parsing verbs
    html_doc.search('td[bgcolor] > p').each do |element|
      list_of_verbs << element.text.strip.downcase.gsub(/,/, ' /')
    end

    ## Removing noises
    (0..6).each do |i|
      i = 0
      list_of_verbs.delete_at(i)
      i += 1
    end

    ## building instances by 4
    list_of_verbs.each_slice(4).to_a.each do |array|

      verb_data = {
       infinitive: array[0],
       simple_past: array[1],
       past_participle: array[2],
       translation: array[3],
      }

      Verb.create(verb_data)
    end
  end
end
