import UIKit

/*

// To document a method automatically, we let the cursor inside the name of the method and press the cmd + option + /

/// Método que executa uma requisição HTTP
///
/// - Parameters:
///   - url: URL contendo a rota que será chamada
///   - method: Método HTTP utilizado na requisição
///   - parameters: Dados que irão no corpo da requisição
///   - header: Cabeçalho da requisição
func request(url: URL, method: String, parameters: [String : Any], header: [String: Any]) -> Void {
}

// Variables and Constants
var accountBalance = -790.06

Int.max
Int.min

// It's a type that we use to store some floating numbers
Decimal(100)

let name = "Gabriel"

var sentence = "Oi, \t\t somos a Ame. \nE viemos para revolucionar a maneira que \"você\" lida com o dinheiro"
var sentenceInSwiftFive = #"The "rain" will follow "#

print(sentence)
print(sentenceInSwiftFive)

// String interpolation
var description = "Olá, meu nome é \(name)"

// Generating a random number
Int.random(in: 0...9)

let number = 21

number.isMultiple(of: 7)

// To get the square root of a number
64.0.squareRoot()

var roundNumber = 37.45

roundNumber.round(.down)
roundNumber.round(.up)

var isiOSTop = true

// This method turns the true value to false value
isiOSTop.toggle()

// Tuple
let student: (name: String, age: Int, grade: Double) = (name: "Joãozinho", age: 24, grade: 9)

print("O nome do aluno é \(student.name)")

let (name2, age, grade) = student

print(name2)

// Optional
var food: String?
    food = "Café"

print("Eu gosto de \(food)")

// Way of unwrap the optional value without checking if the content of the variable it's safe
print("Eu gosto de \(food!)")

// Way of unwrap the optional checking if the content of the variable it's safe
if let food = food {
    print("Eu gosto de \(food)")
}

// Way of unwrap using the Nil Coalescing Operator
print(food ?? "Leite")

var eight = "8"
let number2 = Int("8") ?? Int(eight) ?? 8

// Closed Range and Half-Open Range
let sena = Int.random(in: 1...60)

// Pattern Match Operator
let statusCode = 401

if 200...299 ~= statusCode {
    print("Sucesso")
} else {
    print("Erro")
}

// Flux Control and Conditional Structures
let studentGrade = 6.5

if studentGrade >= 7.0 {
    print("Aprovado")
} else {
    print("Prepara o bolso")
}

// Switch
var temperature = 19

switch temperature {
    case ..<12:
        print("It's very cold")
    
    case 12..<21:
        print("It's nice")
    
    case 22..<29:
        print("A little bit hot")
    
    default:
        print("Extremally hot")
}

let location = (x: 20, y: 30, z: 40)

switch location {
    case (0, 0, 0):
        print("Está na origem")
    
    case (_, 0, 0):
        print("Está no eixo X")
    
    case (0, 0, _):
        print("Está no eixo Z")
    
    case let (x, y, _) where x == y:
        print("Ele está na mesma linha nos eixos X e Y, Linha \(x)")
    
    default:
        print("Sabe Deus onde ele está")
}

// Enumerators
enum Compass {
    case north, south, east, west
}

var compass : Compass = .south

enum Month : String {
    case january = "janeiro", february = "fevereiro", march = "março", april = "abril"
}

let month : Month = .march

print("Você nasceu em \(month.rawValue)")

enum ApiError {
    case invalidURL(URL)
    case taskError(NSError)
    case noResponse
    case noData
    case invalidData(Data)
    case invalidStatusCode
    case unknow
}

// Enumerators with associated values
enum Measure {
    case age(Int)
    case weight(Double)
    case size(width: Double, height: Double)
}

let myMeasure : Measure = .age(10)
let sizeMeasure : Measure = .size(width: 15.0, height: 10.0)

switch sizeMeasure {
    case .age(let age):
        print("Esta é uma medida de idade e você tem \(age) anos")
    
    case .weight(let weight):
        print("Esta é uma medida de peso e você tem \(weight) quilos")
    
    case .size(let size):
        print("Esta é uma medida de tamanho e você tem \(size.height) de altura e \(size.width) de largura")
}

// Functions
func say(_ sentence: String, to person: String) -> String {
    return "\(sentence) \(person)"
}

let phrase = say("Olá", to: "Gabriel")

print(phrase)

// First Class Citizen
func sum(a: Int, b: Int) -> Int {
    return a + b
}

func subtract(a: Int, b: Int) -> Int {
    return a - b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

func divide(a: Int, b: Int) -> Int {
    return a / b
}

typealias Operation = (Int, Int) -> Int

func calculate(a: Int, b: Int, operation: Operation) -> Int {
    return operation(a, b)
}

calculate(a: 5, b: 10, operation: multiply)

calculate(a: 27, b: 8, operation: {(x: Int, z: Int) -> Int in
    return x % z
})

calculate(a: 27, b: 8, operation: {(x, z) -> Int in
    return x % z
})

calculate(a: 27, b: 8, operation: {(x, z) in
    return x % z
})

calculate(a: 27, b: 8, operation: {
    return $0 % $1
})

calculate(a: 27, b: 8, operation: { $0 % $1 })

calculate(a: 27, b: 8){ $0 % $1 }

func sumValues(_ values: Int...) -> Int {
    var result = 0
    
    for value in values {
        result += value
    }
    
    return result
}

sumValues(2, 5, 6, 7, 10, 12, 14, 16)
 
*/

// Collections
var ages : [Int] = [ 19, 23, 26, 22, 27, 20 ]

ages.append(28)
ages.remove(at: 0)

ages += [33, 12, 76]

ages.sorted()
ages.sort(by: { $0 > $1 })
ages.sort(by: >)

let nextYearAges = ages.map({ $0 + 1 })
let filteredAges = ages.filter({ $0 > 20 })

// Dictionaries
var englishPortuguese : [String : String] = [
    "cat": "gato",
    "beautiful": "bonito",
    "popcorn": "pipoca"
]

englishPortuguese["english"] = "inglês"
englishPortuguese["english"] = "englês"
englishPortuguese["beautiful"] = nil

if let popcorn = englishPortuguese["popcorn"] {
    print("Eu adoro comer \(popcorn)")
}

// Flux Control - While and For
var playerLifes : Int = 8

while playerLifes > 0 {
    playerLifes -= 1
}

for age in ages {
    print("A minha idade é \(age)")
}

for word in englishPortuguese {
    print(word.key, word.value)
}

// Set
var states : Set<String> = [
    "SP", "MG", "RJ", "PA", "CE", "BA", "PR"
]

var movies : Set<String> = [
    "Spider-Man", "Vingadores", "Esquadrão Suicida", "Matrix", "Venom"
]

var myWifeMovies : Set<String> = [
    "De Repente 30", "Mensagem pra você", "Sintonia de Amor", "Matrix", "Vingadores"
]

for movie in movies {
    print(movie)
}

movies.count

if movies.contains("Matrix") {
    print("Contém o filme Matrix")
}

movies.insert("John Wick 3")
movies.count
movies.insert("Matrix")

var favoriteMovies = movies.intersection(myWifeMovies)

movies.union(myWifeMovies)
movies.subtract(myWifeMovies)

// Custom Operators
let 🐶 : String = "Cachorro Lulu"
let 🐩 : String = "Cachorro Lilica"
let 💩 = "cocô"

print("O \(🐶) e a \(🐩) adoram fazer \(💩)")

prefix operator >-

prefix func >- (rhs : Int) -> Double {
    return Double(rhs).squareRoot()
}

>-10

postfix operator -<

postfix func -< (lhs : Int) -> Int {
    return lhs / 2
}

10-<

infix operator >-<

func >-< (total : Int, universe : Int) -> [Int] {
    var numbers : [Int] = []
    
    while numbers.count < total {
        let randomNumber = Int.random(in: 1...universe)
        
        if !numbers.contains(randomNumber) {
            numbers.append(randomNumber)
        }
    }
    
    return numbers.sorted()
}

print(6>-<60)

infix operator ❤️

func ❤️ (total: Int, universe: Int) -> Set<Int> {
    var numbers : Set<Int> = Set<Int>()
    
    while numbers.count < total {
        let randomNumber = Int.random(in: 1...universe)
        
        numbers.insert(randomNumber)
    }
    
    return numbers
}

print(10❤️100)

// Class vs Structs
struct Person {
    var name : String
    var age : Int
}

var vitor : Person = Person(name: "Vitor", age: 41)
var julio = vitor

vitor.age += 1
vitor.name = "Victor"
julio.name

class Individual {
    var name: String
    var age : Int
    weak var friend : Individual?
    
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    
    deinit {
        print("\(name) morreu")
    }
}

// ARC - Automatically Reference Couting
var isadora : Individual? = Individual(name: "Isadora", age: 27)
var ygor : Individual? = Individual(name: "Ygor", age: 36)

isadora?.friend = ygor
ygor?.friend = isadora

isadora = nil
ygor = nil

// Error threatment
class Temperature {
    var celsius : Double
    var fahrenheit : Double {
        get {
            return celsius * 9 / 5 + 32
        }
        
        set {
            celsius = (newValue - 32) * 5 / 9
        }
    }
    
    init(celsius : Double) {
        self.celsius = celsius
    }
}

var temperature = Temperature(celsius: 10)

print("Temperatura em Celius \(temperature.celsius)")
print("Temperatura em Fahrenheit \(temperature.fahrenheit)")
