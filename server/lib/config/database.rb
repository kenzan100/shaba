require 'sequel'

DB = Sequel.connect(
  ENV["DATABASE_URL"] || ENV["SHABA_DATABASE_URL"],
  max_connection: 3
)

# logger: Logger.new("log/sequel.log")
