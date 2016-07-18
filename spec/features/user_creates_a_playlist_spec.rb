require 'rails_helper'

RSpec.feature "User creates a playlist" do
  scenario "they see the page for the individual playlist" do
    testone, testtwo, testthree = create_list(:song, 3)

    playlist_name = "Tester"

    visit playlists_path
    click_on "New playlist"
    fill_in "playlist_name", with: playlist_name
    check("song-#{testone.id}")
    check("song-#{testthree.id}")
    click_on "Create Playlist"

    expect(page).to have_content playlist_name

    within("li:first") do
      expect(page).to have_link testone.title, href: song_path(testone)
    end

    within("li:last") do
      expect(page).to have_link testthree.title, href: song_path(testthree)
    end
  end
end
