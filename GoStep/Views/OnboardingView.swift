import SwiftUI

struct OnboardingView: View {
    //Animation Properties
    @State var showWalkThroughScreens: Bool = false
    @State var currentIndex: Int = 0
    @State var showHomeView: Bool = false
    
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some View {
        ZStack {
            if showHomeView {
                HomeView()
                    .transition(.move(edge: .trailing))
            }else {
                ZStack {
                    Color("BG")
                        .ignoresSafeArea()
                    
                    OnboardingScreen()
                    
                    WalkthroughScreens()
                    
                    NavBar()
                }
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.35), value: showHomeView)
    }
    
    //Walkthough
    @ViewBuilder
    func WalkthroughScreens()->some View{
        let isLast = currentIndex == slides.count
        
        GeometryReader {
            let size = $0.size
            
            ZStack {
                //Walkthrough Screens
                ForEach(slides.indices,id: \.self) {index in
                    ScreenView(size: size, index: index)
                }
                
                //Welcome
                WelcomeView(size: size, index: slides.count)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            //Next Button
            .overlay(alignment: .bottom) {
                //Continue to SignUp
                ZStack {
                    Image(systemName: "chevron.right")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .scaleEffect(!isLast ? 1 : 0.001)
                        .opacity(!isLast ? 1 : 0)
                    
                    HStack {
                        Text("Unlock")
                            .font(.custom(workSansBold, size: 15))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                        
                        Image(systemName: "arrow.right")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.trailing, 10)
                    }
                    .padding(.horizontal, 15)
                    .scaleEffect(isLast ? 1 : 0.001)
                    .frame(height: isLast ? nil : 0)
                    .opacity(isLast ? 1 : 0)
                }
                .frame(width: isLast ? size.width / 1.5 : 55, height: isLast ? 50 : 55)
                .foregroundColor(.white)
                .background {
                    RoundedRectangle(cornerRadius: isLast ? 30 : 30, style: isLast ? .continuous : .circular)
                        .fill(.blue)
                    }
                    .onTapGesture {
                        //Update slide index
                        if currentIndex == slides.count {
                            //SignUp
                            showHomeView = true
                        }
                        else {
                            currentIndex += 1
                        }
                    }
                    .offset(y: isLast ? -40 : -90)
                    .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: isLast)
            }
            .overlay(alignment: .bottom, content: {
                //Bottom SignIn Button
                //let isLast = currentIndex == slides.count
                
//                HStack(spacing: 5) {
//                    Text("Already have an account?")
//                        .font(.custom(workSansRegular, size: 14))
//                        .foregroundColor(.gray)
//
//                    Button("Login") {
//
//                    }
//                    .font(.custom(workSansBold, size: 14))
//                    .foregroundColor(.blue)
//                }
//                .offset(y: isLast ? -12 : 100)
//                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: isLast)
            })
            .offset(y: showWalkThroughScreens ? 0 : size.height)
        }
    }
    
    //Screen/slides View
    @ViewBuilder
    func ScreenView(size: CGSize, index: Int)->some View {
        let slide = slides[index]
        
        VStack(spacing: 10) {
            Text(slide.title)
                .font(.custom(workSansBold, size: 28))
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Text(slide.text)
                .font(.custom(workSansRegular, size: 14))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Image(slide.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
        }
    }
    
    // Welcome Screen
    @ViewBuilder
    func WelcomeView(size: CGSize, index: Int)->some View {
        VStack(spacing: 10) {
            Image("sammy-1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            Text("Welcome")
                .font(.custom(workSansBold, size: 28))
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
                
            Text("Track your daily steps and live a balanced and healthier life!")
                .font(.custom(workSansRegular, size: 14))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
                
        }
        .offset(y: -30)
        .preferredColorScheme(.dark)
    }
    
    //Nav Bar
    @ViewBuilder
    func NavBar()->some View {
        let isLast = currentIndex == slides.count
        HStack {
            Button {
                if currentIndex > 0 {
                    currentIndex -= 1
                }
                else {
                    showWalkThroughScreens.toggle()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            Button("Skip") {
                currentIndex = slides.count
            }
            .font(.custom(workSansRegular, size: 14))
            .foregroundColor(.blue)
            .opacity(isLast ? 0 :1)
            .animation(.easeInOut, value: isLast)
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(y: showWalkThroughScreens ? 0 : -120)
    }
    
    //Onboarding Intro
    @ViewBuilder
    func OnboardingScreen()->some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 10) {
                Image("sammy-1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width, height: size.height / 2)
                
                Text("GoStep")
                    .font(.custom(workSansBold, size: 27))
                    .padding(.top,55)
                
                Text("GoStep is your go to app for all walkers and runners. Track your activtiy stats and stay healthy.")
                    .font(.custom(workSansRegular, size: 14))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Text("Let's Go!")
                    .font(.custom(workSansSemiBold, size: 14))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 14)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(.blue)
                    }
                    .onTapGesture {
                        showWalkThroughScreens.toggle()
                    }
                    .padding(.top, 30)
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            //Animation
            .offset(y: showWalkThroughScreens ? -size.height : 0)
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .preferredColorScheme(.dark)
    }
}


////Home View
//struct Home: View {
//
//    @StateObject var authenticationManager = AuthenticationManager()
//
//    var body: some View {
//        //RootView()
//        VStack {
//            LoginView()
//                .environmentObject(AuthenticationManager())
//                .preferredColorScheme(.dark)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .edgesIgnoringSafeArea(.all)
//        .alert(isPresented: $authenticationManager.showAlert){
//            Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Error trying to login, please try again."), dismissButton: .default(Text("Ok")))
//        }
//    }
//}
