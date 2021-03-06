// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import SwiftUI

/// The SwiftUI view that appears as an overlay to our Flutter.
@available(iOS 14.0, *)
struct OverlaySwiftUIView: View {
  
  @ObservedObject var controller: OverlayFlutterViewController
  
  @State var text: String = ""
  
  @State var selectedText: String = ""
  
  // Add your controls here
  var controlDictionary: [String: (String, AnyView)] {
    ["CupertinoButton": // Key
      ("Cupertino Button", // Dropdown menu title
       AnyView(Button("Button", action: { }))  // View
      ),
     "CupertinoTextField":
      ("Cupertino TextField",
       AnyView(TextField("Placeholder", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle()))
      ),
     "CupertinoPicker":
      ("Cupertino Picker",
       AnyView(Picker(selection: $selectedText, label: Text("")) {
        ForEach(["One", "Two", "Three", "Four", "Five"], id: \.self) {
          Text($0)
        }
       })
      ),
    ]
  }
  
  var body: some View {
    (controlDictionary[controller.controlKey]?.1 ?? AnyView(Text("Nothing Selected")))
      .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all)  }
}
