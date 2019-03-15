
// Implement a function that will tell me for each palindrome, how many times it occurs.

import Cocoa

var sentence = "madam dsa anna Repaper kayak Rotor notapalindrome rotor repaper anna repaper dsaho civic repaper Repaper repaper repaper"

func checkPalindrome(sentence: String) -> [String: Int] {
    
    var dic = [String: Int]()
    var arrayForGetLongestPalindrome = [String]()
    
    // 1. sentenceの中のスペースで区切りwordを取得
    let stringArr = sentence.split(separator: " ")
    
    for word in stringArr {
        let lowercasedWord = word.lowercased()
        let reversedWord = String(lowercasedWord.reversed())
        // 2. パリンドロームかチェック
        if lowercasedWord == reversedWord {
            // 3. 重複チェック
            if dic[reversedWord] != nil {
                // 4.重複ならカウントを増やす
                if let count = dic[reversedWord] {
                    dic[reversedWord] = count + 1
                }
                
            } else {
                dic[reversedWord] = 1
            }
            
            arrayForGetLongestPalindrome.append(lowercasedWord)
            
        }
        
    }
    
    if let longstPalindrome = getLongestPalindrome(palindromes: arrayForGetLongestPalindrome) {
        print("longest: ", longstPalindrome)
    }
    
    return dic
}


func getLongestPalindrome(palindromes: [String]) -> String? {
    
    guard var longestPalindrome = palindromes.first else {
        return nil
    }
    
    for palindrome in palindromes {
        if longestPalindrome.count < palindrome.count {
            longestPalindrome = palindrome
        }
    }
    
    return longestPalindrome
    
}

let dic = checkPalindrome(sentence: sentence)
print(dic)
