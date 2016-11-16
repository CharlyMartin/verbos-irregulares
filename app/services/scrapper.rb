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





    ############################################################

    xml_file = open(madyness_rss_url)
    xml_doc = Nokogiri::XML(xml_file)

    xml_doc.search('item').each do |article|

      # Journalist Parsing
      full_name = article.xpath('dc:creator').text
      full_name.split(" ")

      journalist_data = {
        first_name: full_name.split(" ")[0],
        last_name: full_name.split(" ")[1],
        company: "Madyness"
      }
      journalist = Journalist.where(journalist_data).first_or_create

      # Keyword Parsing
      article.xpath('category').each do |k|
        keyword = Keyword.where(name: k.text).first_or_create
        kjist = journalist.keyword_counts.find_or_create_by(keyword: keyword)
        kjist.count += 1
        kjist.save
      end

      # Article Parsing
      article_data = {
        title: article.xpath('title').text,
        link: article.xpath('link').text,
        writed_at: article.xpath('pubDate').text,
        journalist: journalist
      }

      article = Article.find_or_create_by(article_data)


    end

  end
end
