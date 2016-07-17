require 'rails_helper'

RSpec.feature "User updates a playlist" do
  scenario "the specific playlist is updated" do
    playlist= create(:playlist_with_songs)
    one, two, three = playlist.songs
    updated_song= create(:song, title: "Tester")

    visit playlist_path(playlist)
    click_on "Edit"
    uncheck("song-#{one.id}")
    check("song-#{updated_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content playlist.name
    expect(page).to_not have_content one.title
    expect(page).to have_content updated_song.title
  end
end
