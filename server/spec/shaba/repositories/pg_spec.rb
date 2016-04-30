require 'shaba'
RSpec.describe "pg" do
  it "executes arbitrary sql" do
    begin
      Repository.new.execute "CREATE DATABASE shaba_test"
      Repository.new.execute "CREATE TABLE memos"
      Repository.new.execute "SELECT * FROM memos"
    rescue PG::DuplicateDatabase => e
      puts e
    end
  end
end
