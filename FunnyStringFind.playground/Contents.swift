import Foundation

/*
 Funny String Find
 
 Lorem has a problem for you. He will provide you with a string consisting of lowercase letters, uppercase letters and digits and you have to tell if the string is funny or not.
 
 A string is considered to be funny if it contains at least three vowels in uppercase, alphabet x, y, z in lowercase and only the even digits.
 
 Input Format
 The first line of input consists of numbers of test cases, T
 Next T lines consist of the strings.
 
 Constraints
 1<= T <=10
 1<= |string_length| <=1000
 
 Output Format
 For each test case, print "FUNNY" if the string is funny otherwise print "NOT FUNNY"
 
 Sample TestCase 1
 
 Input
 
 3
 Aeixy246
 ExIOz8y02
 asdxyzERTYUI
 
 
 Output
 NOT FUNNY
 FUNNY
 NOT FUNNY
 */
func funnyCheck(array : [String]) {
    let vowels = ["A","E","I","O","U"]
    for str in array {
        var countV = 0
        var isEvenDigit = true
        var countD = 0
        var dicAlphabet = ["x" : false, "y" : false, "z" : false]
        for char in str {
            let string = String(char)
            if vowels.contains(string) {
                countV += 1
            }
            if let number = Int(string) {
                countD += 1
                if ((number % 2) != 0) {
                    isEvenDigit = false
                }
            }
            if let key = dicAlphabet.keys.first(where: {$0 == string}) {
                dicAlphabet[key] = true
            }
        }
        let trueCount = dicAlphabet.filter({$0.value}).count
        if (countV >= 3) && (trueCount == dicAlphabet.count) && (countD > 0) && (isEvenDigit) {
            print("FUNNY")
        } else {
            print("NOT FUNNY")
        }
    }
}

let arrayOfInput = ["Aeixy246","ExIOz8y02","asdxyzERTYUI"]
funnyCheck(array: arrayOfInput)
