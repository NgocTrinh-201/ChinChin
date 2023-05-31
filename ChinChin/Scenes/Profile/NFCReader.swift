//
//  NFCReader.swift
//  ChinChin
//
//  Created by Do Trinh on 30/05/2023.
//
//Hello
import SwiftUI
import CoreNFC

struct NFCReader: View {
    @StateObject var data = Data.shared
    var body: some View {
        VStack {
            Text("\(data.data)")
            ScanButton()
                .frame(height: 50)
        }
    }
}

struct NFCReader_Previews: PreviewProvider {
    static var previews: some View {
        NFCReader()
    }
}

struct ScanButton: UIViewRepresentable {
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton()
        button.setTitle("Scan", for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(context.coordinator, action: #selector(context.coordinator.buttoClick(_:)), for: .touchUpInside)
        return button
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> ScanButton.Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, NFCNDEFReaderSessionDelegate {
        let data = Data.shared
        var session: NFCNDEFReaderSession?
        
        @objc func buttoClick(_ sender: Any) {
            guard NFCNDEFReaderSession.readingAvailable else {
                data.data = "dont supoort"
                return
            }
            session = NFCNDEFReaderSession(delegate: self, queue: .main, invalidateAfterFirstRead: true)
            session?.begin()
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
            data.data = error.localizedDescription
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
            guard let records = messages.first?.records.first else {
                return
            }
            //
            //check dieu kien
            //mo app
            data.data = records.description
        }
    }
    
}

class Data: ObservableObject {
    @Published var data = "No data"
    public func setData(_ data: String) {
        self.data = data
    }
    static let shared = Data()
}
