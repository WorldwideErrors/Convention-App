import SwiftUI
import CodeScanner
import AVFoundation

struct ScanView: View {
    
    @State private var scannedEvent: Event?
    @State private var hasScanned = false
    @State private var isTorchOn = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 📷 Camera
                CodeScannerView(
                    codeTypes: [.qr],
                    completion: handleScan
                )
                .ignoresSafeArea()
                
                // 🌫️ Dark overlay
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                VStack {
                    header
                    Spacer()
                    scanFrame
                    Spacer()
                }
                .padding()
            }
            // 🚀 Navigation happens here
            .navigationDestination(item: $scannedEvent) { event in
                EventDetailView(event: event)
                    .onDisappear {
                        hasScanned = false
                    }
            }
        }
    }
    
    // MARK: - Header
    var header: some View {
        VStack(spacing: 16){
            Text("Scan QR Code")
                .font(.title)
                .fontWeight(.bold)
            Text("""
                    To enter an activity you have to scan the QR code at the gate of the activity.
                    After scanning, you will be redirected to the activity page where you can check in.
                    """)
                .font(.subheadline)
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(.thinMaterial.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .foregroundStyle(Color("text-color"))
    }
    
    // MARK: - Scan Frame
    var scanFrame: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 2)
                .frame(width: 250, height: 250)
        }
    }
    
    // MARK: - Scan Logic
    func handleScan(result: Result<ScanResult, ScanError>) {
        guard !hasScanned else { return }
        hasScanned = true
        
        if case let .success(code) = result {
            
            // 📳 Haptic
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            
            if let event = getEventByID(from: code.string) {
                scannedEvent = event // 👉 triggers navigation
            } else {
                // allow retry
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    hasScanned = false
                }
            }
        }
    }
}
