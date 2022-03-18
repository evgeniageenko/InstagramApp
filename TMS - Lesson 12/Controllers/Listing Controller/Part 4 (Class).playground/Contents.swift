import UIKit

class Chessman {
    
    enum ChessmanType {
        case king
        case castle
        case bishop
        case pawn
        case knight
        case queen
    }

    enum ChessmanColor {
        case black, white
    }
    
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    
    init(type: ChessmanType, color: ChessmanColor, figure: Character){
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
    
    
    init(type: ChessmanType, color: ChessmanColor, figure: Character, coordinates:(String, Int)){
        self.type = type
        self.color = color
        self.figureSymbol = figure
            setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    //Установка координат
    func setCoordinates(char c: String, num n: Int) {
        coordinates = (c, n)
    }
    
    //Взятие фигуры
    func kill() {
        coordinates = nil
    }
}

var kingWhite = Chessman(type: .king, color: .white, figure: "\u{2654}")
kingWhite.setCoordinates(char: "E", num: 1)

var queenBlack = Chessman(type: .queen, color: .black, figure: "\u{2655}", coordinates: ("A", 6))

