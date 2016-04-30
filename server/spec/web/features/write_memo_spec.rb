require 'features_helper'
describe 'basic usecase', type: :feature do
  it "allows a user to write a memo" do
    visit "/"
    expect(page).to have_content "Write New Memo"
    writing_txt = "Today I am happy :)"
    fill_in :memo_content, with: writing_txt
    click_on "Save"
    expect(page).to have_content writing_txt
  end
end
