
import SwiftUI

struct OnBoardingView: View {
    
    @State var currentIndex = 0
    @State private var navigateToHome = false
    
    let dataModel = DataModel()
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                Image(dataModel.cardsList[currentIndex].abstractBackground)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                

                
                VStack{
                    
                    Image("logo2")
                        .resizable()
                        .scaledToFit( )
                        .padding(.horizontal, 100)
                        .offset(x:0, y: -80)
                        
                        
                    
    
                    
                    
                    VStack{
                        Text(dataModel.cardsList[currentIndex].label1)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        Text(dataModel.cardsList[currentIndex].label2)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .padding(.bottom, 16)
                        Image(dataModel.cardsList[currentIndex].image)
                            .frame(height: 320)
                    }
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut(duration: 0.5), value: currentIndex)
               
 
                    HStack{
                        //voltar
                        if currentIndex >= 1{
                            Button{
                                if currentIndex > 0 {
                                    currentIndex -= 1
                                }
                                } label: {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.black)
                                        .frame(width: 50, height: 50)
                                        .background(.white)
                                        .clipShape(Circle())
                                }
                        }

                        
                        
                        //proximo
                        if currentIndex < dataModel.cardsList.count - 1 {
                            Button {
                                currentIndex += 1
                            } label: {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 50)
                                    .background(.white)
                                    .clipShape(Circle())
                            }
                        } else {
                            NavigationLink(destination: CustomTabBarView()) {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 50)
                                    .background(.white)
                                    .clipShape(Circle())
                            }
                        }
                        
                        }
                    .padding(.bottom, 40)
                    
                    
                    //pular
                    VStack{
                        NavigationLink(destination: CustomTabBarView()) {
                            Text("Pular")
                                .foregroundColor(.cinzaClaro)
                                .font(.subheadline)
                                .fontWeight(.light)
                          
                                
                        }
                    }
                        
                    }
                .padding(16)

                }
            .toolbar(.hidden, for: .navigationBar)
            }
        }
        
    }


#Preview {
    OnBoardingView()
}
