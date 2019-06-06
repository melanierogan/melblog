require 'pg'

class Blogger
  attr_reader :id, :name, :message, :created_on

  def initialize(id, name, message, created_on)
    @id = id
    @name = name
    @message = message
    @created_on = created_on
  end

  def self.all
    connection = PG.connect(dbname: 'blogger')
    result = connection.exec( "SELECT * FROM blogger" )
    result.map { |blogger| Blogger.new(blogger['id'], blogger['name'], blogger['message'],  blogger['created_on']) }
  end

  def to_s
    "#{@id} #{@name} #{@message} #{@created_on}"
  end
end
