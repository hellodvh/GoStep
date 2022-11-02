import SwiftUI

struct StatsView: View {
    
    //initialize health kit repository
    private var repository = HKRepository()
    
    var item: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: .infinity)), count: 1)
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: item, spacing: 2) {
                    ForEach(Activity.allActivities()) { activity in
                        NavigationLink(destination: DetailView(activity: activity, repository: repository)) {
                            VStack {
                                Image(activity.image)
                                    .frame(width: 30, height: 30)
                                    
                                
                                Text(activity.name)
                                    .fontWeight(.regular)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.padding()
            }
            .navigationTitle("Health Stats")
        }.onAppear{
            repository.requestAuthorization { success in
                print("Auth success? \(success)")
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
