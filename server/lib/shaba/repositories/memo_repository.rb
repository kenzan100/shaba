require 'pg'
class Repository
  def initialize
    $conn = PG::Connection.new
  end

  def execute(sql)
    $conn.exec sql
  end
end
