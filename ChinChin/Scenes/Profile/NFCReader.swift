//
//  NFCReader.swift
//  ChinChin
//
//  Created by Do Trinh on 30/05/2023.
//

import SwiftUI
import CoreNFC

struct ViewNFC: View {
    
    @State var showSheet = false
    var body: some View {
        VStack {
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Click me")
            }
        }
        .overlay(alignment: .bottom) {
            if showSheet {
                NFCReader()
                    .onTapGesture {
                        showSheet.toggle()
                    }
            }
        }
    }
}

struct NFCReader: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> NFCReaderm{
        return NFCReaderm ()
    }
    
    func updateUIViewController(_ uiViewController: NFCReaderm, context: Context) {
        
    }
    
    typealias UIViewControllerType = NFCReaderm
}

struct NFCReader_Previews: PreviewProvider {
    static var previews: some View {
        NFCReader()
    }
}

struct NFCReaderView: View {
    @StateObject var data = Data.shared
    var body: some View {
        VStack {
            Text("\(data.data)")
        }
    }
}

class NFCReaderm:UIViewController, NFCNDEFReaderSessionDelegate {
    var session: NFCNDEFReaderSession?
    override func viewDidAppear(_ animated: Bool) {
        session = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        let hosting = UIHostingController(rootView: NFCReaderView())
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        hosting.view.frame = UIScreen.main.bounds
        hosting.view.backgroundColor = .red
        self.parent?.view.addSubview(hosting.view)
        self.parent?.addChild(hosting)
        session?.begin()
        print("NFC being \(session)")
    }
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("NFC error \(error.localizedDescription)")
        DispatchQueue.main.async{
            Data.shared.data = error.localizedDescription
        }
    }
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        var result = ""
        for payload in messages[0].records {
            result += payload.identifier.description
        }
        print(result)
        DispatchQueue.main.async {
            Data.shared.data = result
        }
    }
}

class Data: ObservableObject {
    @Published var data = "Bo the vao sau lung"
    public func setData(_ data: String) {
        self.data = data
    }
    
    static let shared = Data()
}

