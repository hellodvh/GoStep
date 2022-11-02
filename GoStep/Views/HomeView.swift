import SwiftUI

//Home View
struct HomeView: View {
    
    //@StateObject var authenticationManager = AuthenticationManager()
    
    var body: some View {
        
    RootView()
    .preferredColorScheme(.dark)
//                NavigationView {
//                    VStack {
//                        if authenticationManager.isAuthenticated {
//                            RootView()
//                        } else {
//                            LoginView()
//                                .environmentObject(authenticationManager)
//                                .preferredColorScheme(.dark)
//                        }
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .edgesIgnoringSafeArea(.all)
//                    .alert(isPresented: $authenticationManager.showAlert){
//                        Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Error trying to login, please try again."), dismissButton: .default(Text("Ok")))
//                    }
//                }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
