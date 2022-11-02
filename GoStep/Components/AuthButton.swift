import SwiftUI

struct AuthButton: View {
    var image: String?
    var showImage = true
    var text: String
    
    var body: some View {
        HStack{
            if showImage {
                Image(systemName: image ?? "person.fill")
                    .tint(.white)
            }
            
            Text(text)
                .foregroundColor(.white)
        }
        .padding()
        .padding(.horizontal)
        .background(.blue)
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(image: "faceid", text: "Login with FaceID")
    }
}
