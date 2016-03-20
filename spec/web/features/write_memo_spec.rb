require 'features_helper'
describe 'cli usecase', type: :feature do
  it "allows a user to write a memo" do
    visit "/"
    expect(page.body).to eq "Hello World"
  end
end
