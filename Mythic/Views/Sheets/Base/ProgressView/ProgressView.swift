//
//  ProgressView.swift
//  Mythic
//
//  Created by Esiayo Alegbe on 24/9/2023.
//

import SwiftUI

struct ProgressViewSheet: View {
    @Binding var isPresented: Bool
    @State private var timeoutWarning = false
    @State private var dismissableWithEsc = false

    var body: some View {
        VStack {
            ProgressView()
                .padding()
                .interactiveDismissDisabled(!dismissableWithEsc)

            if timeoutWarning {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .imageScale(.large)

                    Text("It seems loading's taking a while.")
                }
                .padding()

                HStack {
                    Button {
                        isPresented = false
                    } label: {
                        Text("Dismiss loading")
                    }

                    Button {
                        timeoutWarning = false
                        dismissableWithEsc = true
                    } label: {
                        Text("Keep waiting (dismissable with esc)")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
        .fixedSize()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 15, repeats: false) { _ in
                timeoutWarning = true
            }
        }
    }
}
