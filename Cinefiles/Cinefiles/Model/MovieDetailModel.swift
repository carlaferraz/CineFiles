//
//  MovieDetail.swift
//  Cinefiles
//
//  Created by Carla Araujo on 30/05/25.
//

import Foundation

// SINGLETON GAMBIARRA DO AFONSO
class MovieModel: ObservableObject {
    static let shared = MovieModel()
    
    @Published var movies: [MovieDetailModel] = .sample()
    
    private init() {}
}

struct MovieDetailModel: Identifiable {
    
    var id = UUID()
    
    var title: String
    var category: [String]
    var image: String
    var description: String
    var streaming: [String]
    var imdb: String
    var direction: String
    var year: String
    
    var isFavorite: Bool = false
    var isSeen: Bool = false
}

extension Array where Element == MovieDetailModel {
    static func sample() -> [MovieDetailModel] {
        [
            MovieDetailModel(
                title: "A Vastidão da Noite",
                category: ["Drama", "Sci-Fi", "Suspense"],
                image: "a-vastidao-da-noite",
                description: "Em uma noite de 1950, na cidade de Cayuga, Novo México, dois jovens ouvem uma misteriosa frequência de áudio e saem em busca de sua origem.",
                streaming: ["amazon"],
                imdb: "6.7 / 10",
                direction: "Andrew Patterson",
                year: "2019",
                isFavorite: false,
                isSeen: true
            ),
            MovieDetailModel(
                title: "As Passivonas",
                category: ["Comédia"],
                image: "passivonas",
                description: "Duas alunas não populares do último ano do ensino médio criam um clube da luta para tentar impressionar e conquistar líderes de torcida.",
                streaming: ["desconhecido"],
                imdb: "N/A",
                direction: "Emma Seligman",
                year: "2023",
                isFavorite: false,
                isSeen: true
            ),
            MovieDetailModel(
                title: "Os Incríveis",
                category: ["Animação", "Ação", "Aventura"],
                image: "os-incriveis",
                description: "Depois do governo banir o uso de superpoderes, o maior herói do planeta, o Sr. Incrível, vive de forma pacata com sua família. Apesar de estar feliz com a vida doméstica, o Sr. Incrível ainda sente falta dos tempos em que viveu como super-herói, e sua grande chance de entrar em ação novamente surge quando um velho inimigo volta a atacar. Só que agora ele precisa contar com a ajuda de toda a família para vencer o vilão.",
                streaming: ["disney-plus", "amazon"],
                imdb: "8.0 / 10",
                direction: "Brad Bird",
                year: "2004",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "O Feitiço de Áquila",
                category: ["Fantasia", "Aventura", "Romance"],
                image: "o-feitico-de-aquila",
                description: "O ladrão Gaston escapa da masmorra medieval de Aquila através da latrina. Os soldados estão prestes a matá-lo quando Navarra o salva. Navarra, viajando com seu falcão animado, planeja matar o bispo de Áquila com a ajuda de Gaston.",
                streaming: ["apple-tv"],
                imdb: "7.0 / 10",
                direction: "Richard Donner",
                year: "1985",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Os Serviços de Entrega da Kiki",
                category: ["Animação", "Fantasia", "Aventura"],
                image: "kikis-delivery-service",
                description: "Por ordem de sua mãe, Kiki parte para um aprendizado de um ano, acompanhada por seu gato preto. A um comando de sua vassoura mágica, ela vai parar na charmosa cidadezinha de Moreoastal. Infelizmente, os hotéis locais não aceitam bruxas e a polícia a flagra fazendo algumas travessuras.",
                streaming: ["netflix"],
                imdb: "7.8 / 10",
                direction: "Hayao Miyazaki",
                year: "1989",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Tudo em Todo o Lugar ao Mesmo Tempo",
                category: ["Ação", "Aventura", "Comédia"],
                image: "tudo-em-todo-o-lugar-ao-mesmo-tempo",
                description: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado",
                streaming: ["amazon"],
                imdb: "7.8 / 10",
                direction: "Dan Kwan, Daniel Scheinert",
                year: "2022",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Cisne Negro",
                category: ["Drama", "Suspense", "Thriller"],
                image: "cisne-negro",
                description: "Uma esforçada bailarina luta para manter sua sanidade após obter o papel principal no Lago dos Cisnes de Tchaikovsky.",
                streaming: ["netflix"],
                imdb: "8.0 / 10",
                direction: "Darren Aronofsky",
                year: "2010",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Barbie e a Princesa e a Plebeia",
                category: ["Animação"],
                image: "barbie-princesa-e-plebeia",
                description: "Uma plebeia, moradora de um vilarejo, é muito parecida com a princesa do reino. Os destinos das duas se cruzam quando a princesa é sequestrada, e a moça humilde usa sua incrível semelhança com ela para tentar salvar das mãos do vilão.",
                streaming: ["netflix"],
                imdb: "6.8 / 10",
                direction: "William Lau",
                year: "2004",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "O Show de Truman: O Show da Vida",
                category: ["Comédia", "Drama", "Sci-Fi"],
                image: "o-show-de-truman",
                description: "Truman Burbank é um pacato vendedor de seguros que leva uma vida simples com sua esposa Meryl Burbank. Porém, algumas coisas ao seu redor fazem com que ele passe a estranhar sua cidade, seus supostos amigos e até sua mulher. Após conhecer a misteriosa Lauren, ele fica intrigado e acaba descobrindo que toda sua vida foi monitorada por câmeras e transmitida em rede nacional.",
                streaming: ["amazon"],
                imdb: "8.2 / 10",
                direction: "Peter Weir",
                year: "1998",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Spirit: O Corcel Indomável",
                category: ["Animação", "Aventura", "Família"],
                image: "spirit-o-corcel-indomavel",
                description: "Animação sobre a amizade entre um menino indígena e um cavalo indomável apaixonado por uma égua. Ambientada no Velho Oeste americano, mostra o impacto do processo civilizatório na vida dos três e também na amizade que construíram.",
                streaming: ["netflix, amazon"],
                imdb: "7.2 / 10",
                direction: "Kelly Asbury, Lorna Cook",
                year: "2002",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "O Labirinto do Fauno",
                category: ["Fantasia", "Drama", "Guerra"],
                image: "o-labirinto-do-fauno",
                description: "Em 1944, na Espanha, a jovem Ofélia e sua mãe doente chegam ao posto do novo marido de sua mãe, um sádico oficial do exército que está tentando reprimir uma guerrilheira. Enquanto explorava um labirinto antigo, Ofélia encontra o Pan fauno, que diz que a menina é uma lendária princesa perdida e que ela precisa completar três tarefas perigosas a fim de se tornar imortal.",
                streaming: ["amazon"],
                imdb: "8.2 / 10",
                direction: "Guillermo del Toro",
                year: "2006",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "O Predestinado",
                category: ["Ação", "Sci-Fi", "Thriller"],
                image: "o-predestinado",
                description: "Um agente temporal viaja no tempo para impedir um terrorista, mas sua missão se torna uma jornada de autodescoberta.",
                streaming: ["netflix"],
                imdb: "7.5 / 10",
                direction: "Michael Spierig, Peter Spierig",
                year: "2014",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Gigantes de Aço",
                category: ["Ação", "Drama", "Sci-Fi"],
                image: "gigantes-de-aco",
                description: "Em um futuro próximo, as máquinas substituem os homens no ringue. As lutas de boxe acontecem entre robôs de alta tecnologia. Charlie, um ex-lutador frustrado, decide se juntar ao filho para construir um competidor imbatível.",
                streaming: ["disney-plus"],
                imdb: "7.1 / 10",
                direction: "Shawn Levy",
                year: "2011",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Parasita",
                category: ["Comédia", "Drama", "Thriller"],
                image: "parasita",
                description: "Toda a família de Ki-taek está desempregada, vivendo em um porão sujo e apertado. Por obra do acaso, ele começa a dar aulas de inglês para uma garota de família rica. Fascinados com a vida luxuosa destas pessoas, pai, mãe e filhos bolam um plano para se infiltrar também na abastada família, um a um. No entanto, os segredos e mentiras necessários à ascensão social cobram o seu preço.",
                streaming: ["prime-video"],
                imdb: "8.5 / 10",
                direction: "Bong Joon-ho",
                year: "2019",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Turma da Mônica: Uma Aventura no Tempo",
                category: ["Animação", "Aventura", "Infantil"],
                image: "turma-da-monica-aventura-no-tempo",
                description: "Franjinha está construindo uma máquina do tempo e precisa reunir moléculas dos quatro elementos: ar, água, fogo e terra. Mônica joga Sansão e, sem querer, acerta o aparelho, espalhando os elementos. Agora a turma precisa consertá-la.",
                streaming: ["globoplay"],
                imdb: "6.2 / 10",
                direction: "Mauricio de Sousa",
                year: "2007",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Amnésia (Memento)",
                category: ["Mistério", "Thriller"],
                image: "amnesia-memento",
                description: "Leonard está caçando o homem que estuprou e matou sua esposa. Ele tem dificuldades em encontrar o assassino pois sofre de uma forma intratável de perda de memória. Mesmo que ele possa lembrar detalhes da vida antes do acidente, Leonard não consegue lembrar o que aconteceu quinze minutos atrás, onde está indo ou a razão.",
                streaming: ["amazon"],
                imdb: "8.4 / 10",
                direction: "Christopher Nolan",
                year: "2000",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "Os Excêntricos Tenenbaums",
                category: ["Comédia", "Drama"],
                image: "os-excentricos-tenenbaums",
                description: "Royal e sua esposa Etheline tiveram três filhos muito diferentes entre si, mas igualmente bem-sucedidos. Quando Etheline resolve se casar com outro, o irresponsável e excêntrico Royal resolve lutar por seu amor reunindo toda a família.",
                streaming: ["star-plus"],
                imdb: "7.6 / 10",
                direction: "Wes Anderson",
                year: "2001",
                isFavorite: false,
                isSeen: false
            ),
            MovieDetailModel(
                title: "La La Land: Cantando Estações",
                category: ["Musical", "Drama", "Comédia"],
                image: "la-la-land",
                description: "O pianista Sebastian conhece a atriz Mia, e os dois se apaixonam perdidamente. Em busca de oportunidades para suas carreiras na competitiva Los Angeles, os jovens tentam fazer o relacionamento amoroso dar certo, enquanto perseguem fama e sucesso.",
                streaming: ["amazon"],
                imdb: "7.9 / 10",
                direction: "Damien Chazelle",
                year: "2016",
                isFavorite: false,
                isSeen: false
            )
        ]
    }
}
