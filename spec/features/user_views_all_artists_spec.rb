
require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the names of each artist" do
    artists = ["Taylor Swift", "Snoop Dog", "Bob Dylan"].map do |name|
      Artist.create(name: name, image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    end

    visit artists_path

    artists.each do |artist|
      expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end
