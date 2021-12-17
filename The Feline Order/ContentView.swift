import SwiftUI
import SwiftyJSON
struct ContentView: View {
    
    //1.
    
    init() {
      let navBarAppearance = UINavigationBar.appearance()
      navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
  
    @State var characters: JSON = []
    
    @State var charactersArray = [Character]()
    var body: some View {
        
        
       
        
        
        NavigationView {
            
            ZStack{

                Color(0x000000)
                                .edgesIgnoringSafeArea(.all)
            //3.
            
            ScrollView {
                ForEach(charactersArray) { character in
                    CardView(character: character)
                    
                       
                
                }
                
               
                
            }
            //2.
            .onAppear() {
                apiCall().getCharacters { (characters) in
                    self.characters = characters
                    
                    for i in characters.arrayValue {
                        let characterObject = Character(name: i["name"].description, height: i["height"].description, mass: i["mass"].description, hair_color: i["hair_color"].description, skin_color: i["skin_color"].description, eye_color: i["eye_color"].description, birth_year: i["birth_year"].description, gender: i["gender"].description, image: i["name"].description)
                        
                        charactersArray.append(characterObject)
                        
                        print(charactersArray)
                    }
                }
            }
            .navigationTitle("Star Wars Characters").foregroundColor(.white)
        }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        


        
    }
}
struct ContentViewView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
