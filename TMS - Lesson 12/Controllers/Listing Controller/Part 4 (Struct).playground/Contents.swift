import UIKit


struct ChesPlayer {
    var name: String = "Игрок"
    var victories: UInt = 0
    init(name: String) {
        self.name = name
    }
    func description(){
        print("Игрок \(name) имеет \(victories) побед")
    }
    mutating func addVictories(count: UInt = 1) {
        victories + count
    }
}
var playerHelgaPotaki = ChesPlayer(name: "Ольга")
playerHelgaPotaki.victories

var olegMuhin = ChesPlayer(name: "Олег")
var olegLapin = olegMuhin

var andrey = ChesPlayer(name: "Андрей")
andrey.description()

var harold = ChesPlayer(name: "Гарольд")
harold.victories
harold.addVictories()
harold.addVictories(count: 3)

