require 'pg'

class Blogger
  attr_reader :id, :name, :message, :date

  def initialize(id, name, message, date)
    @id = id
    @name = name
    @message = message
    @date = date
  end

  def self.all
    connection = PG.connect(dbname: 'blogger')
    result = connection.exec( "SELECT * FROM blogger;" )
    result.map { |blogger| (blogger['id'], blogger['name'], blogger['message'],  blogger['date']) }
  end

  def to_s
    "#{@id} #{@name} #{@message} #{@date}"
  end
end
