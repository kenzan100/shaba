require 'hanami/mailer'

Dir["#{ __dir__ }/config/**/*.rb"].each { |file| require_relative file }
Dir["#{ __dir__ }/shaba/**/*.rb"].each { |file| require_relative file }

Hanami::Mailer.configure do
  root "#{ __dir__ }/shaba/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
