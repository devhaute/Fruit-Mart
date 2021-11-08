import SwiftUI

struct ContentView: View {
    var store: Store
    
    var body: some View {
        NavigationView {
            List(store.products) { product in
                ProductRow(product: product)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store())
    }
}
