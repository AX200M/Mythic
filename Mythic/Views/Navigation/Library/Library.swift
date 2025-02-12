//
//  Library.swift
//  Mythic
//
//  Created by Esiayo Alegbe on 12/9/2023.
//

import SwiftUI
import SwiftyJSON

struct LibraryView: View {
    @State private var addGameModalPresented = false
    @State private var legendaryStatus: JSON = JSON()

    @State private var isGameListRefreshCalled: Bool = false

    var body: some View {
        GameListView(isRefreshCalled: $isGameListRefreshCalled)

            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        addGameModalPresented = true
                    } label: {
                        Image(systemName: "square.and.arrow.down")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        isGameListRefreshCalled = true
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }

            .sheet(isPresented: $addGameModalPresented) {
                LibraryView.GameImportView(
                    isPresented: $addGameModalPresented,
                    isGameListRefreshCalled: $isGameListRefreshCalled
                )
                .fixedSize()
            }
    }
}

#Preview {
    GameListView(isRefreshCalled: .constant(false))
}
