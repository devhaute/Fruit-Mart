import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
        VStack(spacing: 0) {
            productImage
            orderView
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product.dummyData[0])
    }
}

private extension ProductDetailView {
    var productImage: some View {
        GeometryReader { _ in
            Image(self.product.imageName)
                .resizable()
                .scaledToFill()
        }
    }
    
    var orderView: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                self.productDescription
                Spacer()
                self.priceInfo
                self.placeOrderButton
            }
            .frame(height: proxy.size.height + 10)
            .padding(32)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
    }
    
}

private extension ProductDetailView {
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.name)
                    .font(.largeTitle).fontWeight(.medium)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(.peach)
                    .frame(width: 32, height: 32)
            }
            
            Text(splitText(product.description))
                .foregroundColor(.secondaryText)
                .fixedSize()
        }
    }
    
    var priceInfo: some View {
        Group {
            (Text("₩") + Text(String(product.price)).font(.title))
                .fontWeight(.medium)
            Spacer()
        }
        .foregroundColor(.black)
    }
    
    var placeOrderButton: some View {
        Button {
            
        } label: {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                .overlay(
                    Text("주문하기")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()
                )
        }

    }

    
    private func splitText(_ description: String) -> String {
        guard !description.isEmpty else {
            return description
        }
        
        let centerIndex = description.index(description.startIndex, offsetBy: description.count / 2)
        let centerSpaceIndex = description[..<centerIndex].lastIndex(of: " ")
            ?? description[centerIndex...].firstIndex(of: " ")
            ?? description.index(before: description.endIndex)
        let afterSpaceIndex = description.index(after: centerSpaceIndex)
        let lhsString = description[..<afterSpaceIndex].trimmingCharacters(in: .whitespaces)
        let rhsString = description[afterSpaceIndex...].trimmingCharacters(in: .whitespaces)
        
        return String(lhsString + "\n" + rhsString)
    }
}
