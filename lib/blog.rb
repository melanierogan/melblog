require 'pg'

class Blogger
  attr_reader :id, :url

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'blogger_test')
    else
      connection = PG.connect(dbname: 'blogger')
    end
    result = connection.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| Blogger.new(bookmark['id'], bookmark['url']) }
  end

  def to_s
    "#{@id} #{@url}"
  end
end
