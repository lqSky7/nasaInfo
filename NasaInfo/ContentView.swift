import SwiftUI

struct ContentView : View {
    var body: some View {
        Image(.wallhavenGw767D)
            .resizable()
//            .scaledToFit()
//            .scaledToFill()
//            .frame(width: 300, height: 300)
            .containerRelativeFrame(.horizontal) {
                size, axis in
                return size * 0.8 // render image 80% of horizontal space available.
            }
//            .clipped()
           
    }
}
#Preview {
    ContentView()
}
