import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("도형 만들기")
                .font(.system(size: 30, weight: .bold))
            
            Spacer()
                .frame(height: 10)
            
            VStack(alignment: .leading) {
                Text("둥근 모양")
                    .font(.system(size: 20))
                
                ZStack {
                    Rectangle().frame(height: 10)
                    
                    HStack {
                        Circle()
                            .fill(.gray)
                        
                        Ellipse()
                            .fill(.gray)
                        
                        Capsule()
                            .fill(.gray)
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.gray)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("각진 모양")
                    .font(.system(size: 20))
                
                ZStack {
                    Rectangle().frame(height: 10)
                    
                    HStack {
                        Rectangle()
                            .fill(.gray)
                        Rectangle()
                            .fill(.gray)
                        Rectangle()
                            .fill(.gray)
                    }
                }
            }
        }
        .padding([.leading, .trailing, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
