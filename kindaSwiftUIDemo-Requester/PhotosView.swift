//
//  PhotosView.swift
//  kindaSwiftUIDemo-Requester
//
//  Created by Alex Nagy on 24.04.2023.
//

import SwiftUI
import kindaSwiftUI

// The world easiest & fastest tool belts to mock your APIs
// https://designer.mocky.io

// The Lorem Ipsum for photos.
// https://picsum.photos

struct PhotosView: View {
    
    
    // https://run.mocky.io/v3/b5e974fc-674f-412d-a5e8-aa265254a196
    @RequestResult(request: Request(scheme: .https, host: "run.mocky.io", path: "/v3/b5e974fc-674f-412d-a5e8-aa265254a196", method: .get))
    var photo: Photo?
    
    // https://run.mocky.io/v3/640ec403-39a0-47ce-ac8a-23b7782d6e80
    @RequestResults(request: Request(scheme: .https, host: "run.mocky.io", path: "/v3/640ec403-39a0-47ce-ac8a-23b7782d6e80", method: .get))
    var photos: [Photo]
    
    var body: some View {
        VStack {
            if let err = _photo.configuration.error {
                Text(err.localizedDescription)
                    .font(.caption)
                    .foregroundColor(.gray)
            } else {
                OptionalDataView(for: photo) { photo in
                    AsyncImage(url: URL(string: photo.url)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .clipShape(Rectangle())
                            .overlay {
                                Text(photo.title)
                                    .font(.largeTitle)
                                    .bold()
                            }
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            
            List(photos, id: \.url) { photo in
                HStack {
                    AsyncImage(url: URL(string: photo.url)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Rectangle())
                    } placeholder: {
                        ProgressView()
                    }
                    Text(photo.title)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    fetchPhoto()
                } label: {
                    Image(systemName: "square.and.arrow.down")
                }
            }
        }
    }
    
    func fetchPhoto() {
        Task {
            do {
                let request = Request(scheme: .https, host: "run.mocky.io", path: "/v3/b5e974fc-674f-412d-a5e8-aa265254a196", method: .get)
                let photo = try await Requester().send(request, expect: Photo.self)
                print(photo)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
