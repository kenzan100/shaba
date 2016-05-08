require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/shaba/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/shaba_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/shaba_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/shaba_development'
  #    adapter type: :sql, uri: 'mysql://localhost/shaba_development'
  #
  adapter type: :sql, uri: ENV['SHABA_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  mapping "#{__dir__}/config/mapping"
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/shaba/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
