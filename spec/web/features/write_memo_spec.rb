require 'features_helper'
describe 'basic usecase', type: :feature do
  it "allows a user to write a memo" do
    visit "/"
    expect(page.body).to include "Write New Memo"
    fill_in :memo_content, with: "Today I am happy :)"
  end
end
