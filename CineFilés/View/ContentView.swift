import SwiftUI


// DISCLAIMER:
// Essa parte do código foi feita pela designer Juliana Segalla. Nessa atividade, tentamos sair da nossa zona de conforto e explorar áreas diferentes das que estamos acostumadas. Por conta disso, essa parte do código apresenta partes feitas com IA e segue uma lógica diferente do restante do código.


struct ContentView: View {
    @State private var showLoginModal = false
    @State private var showRegisterModal = false

    var body: some View {
        NavigationStack{
            ZStack {
                // Fundo preto
                Color.black
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    // Logo no topo
                    Image("logo2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 60)
                        .padding(.top)

                    // Imagem horizontal com degradê
                    ZStack {
                        Image("capa-home")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 400)
                            .clipped()

                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color.black.opacity(1.3), location: 0),
                                .init(color: Color.black.opacity(0.0), location: 0.3),
                                .init(color: Color.black.opacity(0.0), location: 0.7),
                                .init(color: Color.black.opacity(1.8), location: 1.1)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    }
                    .frame(maxWidth: .infinity)
                    .padding(-30)

                    // Texto principal
                    VStack(spacing: 0) {
                        Text("Os melhores filmes")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                        Text("em um só lugar")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 5)
                    

                    // Botão "Cadastrar"
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showRegisterModal = true
                        }
                    }) {
                        Text("Crie sua conta")
                            .fontWeight(.semibold)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color(.verde), Color(.rosa)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .padding(.vertical, 12)
                            .frame(width: 350)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(
                                        LinearGradient(
                                            colors: [Color(.verde), Color(.rosa)],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        ),
                                        lineWidth: 2
                                    )
                            )
                            .cornerRadius(30)
                    }
                    
                    
                    HStack{
                        // Texto acima do botão "Cadastrar"
                        Text("Já tem uma conta?")
                            .foregroundColor(.white)
                            .font(.subheadline)
            
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showLoginModal = true
                            }
                        }) {
                            Text("Entrar")
                                .foregroundColor(Color(.rosa))
                                .fontWeight(.semibold)
                                .font(.subheadline)
                             
                        }
                    }
                    .offset(y: -10)

                  

                    Spacer()
                        .frame(height: 60)
                }
                .padding(.horizontal)

                // Fundo escurecido ao abrir modal
                if showLoginModal || showRegisterModal {
                    Color.black.opacity(0.6)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                showLoginModal = false
                                showRegisterModal = false
                            }
                        }
                }

                // Modal como overlay
                if showLoginModal || showRegisterModal {
                    VStack {
                        Spacer()
                        ModalView(
                            title: showLoginModal ? "Entrar" : "Cadastrar",
                            onClose: {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    showLoginModal = false
                                    showRegisterModal = false
                                }
                            },
                            // Propriedade para alternar entre modais
                            onSwitchModal: {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    if showLoginModal { // Se está no Login, vai para Cadastrar
                                        showLoginModal = false
                                        showRegisterModal = true
                                    } else { // Se está no Cadastrar, vai para Login
                                        showRegisterModal = false
                                        showLoginModal = true
                                    }
                                }
                            }
                        )
                    }
                    .transition(.move(edge: .bottom))
                }
            }
        }
    }
}




struct ModalView: View {
    var title: String
    var onClose: () -> Void
    var onSwitchModal: () -> Void // Novo closure para alternar modais
    

    @State private var showOnBoarding = false

    @State private var showForgotPasswordAlert = false

    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @FocusState private var focusedField: Field?
    var isFormValid: Bool {
            !email.isEmpty && !password.isEmpty
        }

    enum Field {
        case email
        case password
    }

    var isLogin: Bool {
        title.lowercased().contains("entrar")
    }

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 18) {
                //TITULO DA PAGINA
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 25)

                //CAMPO EMAIL
                TextField("", text: $email, prompt: Text("E-mail").foregroundColor(.white.opacity(0.5)))
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(focusedField == .email ? Color(.verde) : Color.clear, lineWidth: 2)
                    )
                    .foregroundColor(.white)
                    .focused($focusedField, equals: .email)

                //CAMPO SENHA
                SecureField("", text: $password, prompt: Text("Senha").foregroundColor(.white.opacity(0.5)))
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(focusedField == .password ? Color(.rosa) : Color.clear, lineWidth: 2)
                    )
                    .foregroundColor(.white)
                    .focused($focusedField, equals: .password)

                
                //ESQUECI MINHA SENHA
                if isLogin{
                    HStack {
                        Spacer()
                        Button("Esqueci minha senha") {
                            showForgotPasswordAlert = true
                        }
                        .font(.footnote)
                        .foregroundColor(Color(.rosa))
                    }
                    .alert("Esqueceu a senha?", isPresented: $showForgotPasswordAlert) {
                        Button("OK", role: .cancel) { }
                        } message: {
                            Text("Um link para redefinir sua senha será enviado para seu e-mail.")
                        }
                }
                
                
                
                
                //LEMBRAR DE MIM
                Toggle(isOn: $rememberMe) {
                    Text("Lembrar de mim")
                        .foregroundColor(.white)
                }
                .toggleStyle(SwitchToggleStyle(tint: .green))

    //            Spacer()

                
                
                
                // BOTAO DE ACAO
                Button(action: {
                    if isFormValid {
                        showOnBoarding = true
                    }
                }) {
                    Text(title)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isFormValid ? Color(.verde) : Color.gray.opacity(0.5))
                        .foregroundColor(isFormValid ? .black : .white.opacity(0.7))
                        .cornerRadius(36)
                }
                .disabled(!isFormValid)

                //NAVEGACAOOO
                .navigationDestination(isPresented: $showOnBoarding) {
                    OnBoardingView()
                }


                
                
                
                
                HStack {
                    Spacer()
                    Text(isLogin ? "Não tem uma conta?" : "Já tem uma conta?")
                        .foregroundColor(.white)

                    // Botão para alternar entre Login e Cadastro
                    Button(action: {
                        onSwitchModal() // Chama o novo closure para alternar o modal
                    }) {
                        Text(isLogin ? "Cadastre-se" : "Entrar")
                            .foregroundColor(Color(.rosa))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                }
                .padding(.bottom, 50) // Aumenta o padding inferior do HStack de navegação
            }
        }
        .padding(.horizontal, 30)
        
        .padding(.bottom, 60)
        .padding(.top, 20)
        .frame(height: UIScreen.main.bounds.height * 0.6)
        .frame(maxWidth: .infinity)
        .background(.cinzaMedio)
        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
    }
}

// Suporte para cores hexadecimais

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


#Preview {
    ContentView()
}
