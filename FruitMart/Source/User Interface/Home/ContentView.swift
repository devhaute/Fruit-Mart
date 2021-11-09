import SwiftUI

struct ContentView: View {
    var store: Store
    
    var body: some View {
        NavigationView {
            List(store.products) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    ProductRow(product: product)
                }

            }
            .navigationBarTitle("과일마트")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store())
    }
}
