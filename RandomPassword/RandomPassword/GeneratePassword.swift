import Foundation

private let characters = Array("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)


func generateRandomStringOf(length length: Int) -> String {
	var string = ""

	for _ in 0..<length {
		string.append(generateRandomCharacter())
	}

	return string
}

func generateRandomCharacter() -> Character {
	let index = Int(arc4random_uniform(UInt32(characters.count)))

	let char = characters[index]
	return char
}
