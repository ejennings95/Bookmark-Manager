require 'PG'

class DatabaseConnection

  def self.setup(name)
   @database  = PG.connect( dbname: name )
  end

  def self.connection
    @database
  end

  def self.query(sql)
    @database.exec(sql)
  end

end
