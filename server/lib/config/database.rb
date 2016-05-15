require 'sequel'

DB = Sequel.connect(
  ENV["SHABA_DATABASE_URL"],
  max_connection: 3,
  logger: Logger.new("log/sequel.log")
)
