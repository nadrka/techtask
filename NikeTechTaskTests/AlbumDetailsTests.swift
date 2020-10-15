import Foundation
import Quick
import Nimble
@testable import NikeTechTask

class AlbumDetailsTests: QuickSpec {

    override func spec() {
        super.spec()
        describe("AlbumDetailsViewModel") {
            let genres: [Genre] = [Genre(name: "Hip Hop"), Genre(name: "Music")]
            let album = Album(artistName: "Artist name", name: "Album name", genres: genres, copyright: "Copyright text", releaseDate: "2020-10-10")
            let sut: AlbumDetailsViewModel = DefaultAlbumDetailsViewModel(album: album)

            context("after initialization") {
                it("has a proper album name") {
                    expect(sut.albumName) == "Album name"
                }

                it("has a proper artist name") {
                    expect(sut.artistName) == "Artist name"
                }

                it("has a proper copyright text") {
                    expect(sut.copyright) ==  "Copyright text"
                }

                it("has a proper genres text") {
                    expect(sut.genres) == "Genres: Hip Hop Music "
                }

                it("has a proper release date text") {
                    expect(sut.releaseDate) == "Release date: 2020-10-10"
                }
            }
        }
    }

}
