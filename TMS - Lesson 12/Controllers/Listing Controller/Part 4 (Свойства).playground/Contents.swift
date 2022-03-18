import UIKit

class Person {
    var firstName = "Имя"
    var secondName = "Фамилия"
    lazy var wholeName: String = self.generateWholeName()
    init (name: String, secondName: String){
        self.firstName = name
        self.secondName = secondName
    }
    func generateWholeName() -> String {
        return firstName + "" + secondName
    }
}
var me = Person(name: "Егор", secondName: "Петров")
me.wholeName
me.secondName = "Иванов"
me.wholeName



//MARK: - Геттер (get) и Сеттер (set). Наблюдатели willSet, didSet

struct Circle {
    var coordinates: (x: Int, y: Int)
    var radius: Float {
        willSet (newValueOfRadius) {
            print("Вместо значения \(radius) будет установлено значение \(newValueOfRadius)")
        }
        didSet (oldValueOfRadius) {
            print("Значение \(oldValueOfRadius) изменено на \(radius)")
        }
    }
    var perimeter: Float {
        get {
            // высчитываем значение, используя текущее значение радиуса
            return 2.0 * 3.14 * radius
        }
        set(newPerimeter) {
            radius = newPerimeter / (2 * 3.14)
        }
    }
}
var myNewCircle = Circle(coordinates: (0, 0), radius: 10)
myNewCircle.perimeter
myNewCircle.perimeter = 31.4
myNewCircle.radius


//MARK: - Свойства типа
struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnmeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 2
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 3
    }
    class var ovverideableComputedTypeProperty: Int {
        return 4
    }
}


struct AudioChannel {
    static var maxVolume = 5
    var volume: Int {
        didSet {
            if volume > AudioChannel.maxVolume {
                volume = AudioChannel.maxVolume
            }
        }
    }
}
var LeftChannel = AudioChannel(volume: 2)
var RightChannel = AudioChannel(volume: 3)
RightChannel.volume = 6
AudioChannel.maxVolume = 10
RightChannel.volume = 8

