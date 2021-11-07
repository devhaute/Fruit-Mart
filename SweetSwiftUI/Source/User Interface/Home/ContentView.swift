import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ProductRow(product: Product.dummyData[0])
            ProductRow(product: Product.dummyData[1])
            ProductRow(product: Product.dummyData[2])
            ProductRow(product: Product.dummyData[3])
            ProductRow(product: Product.dummyData[4])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
