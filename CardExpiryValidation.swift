

    var isMonthLessThanCurrentMonth      :Bool = false
    var currentMonth                     :Int = 0
    var currentYear                      :Int = 0


    func isRestrictExpiryDateCharacters(proString: String , string : String) -> Bool {
        let date = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(in: .current, from: date as Date)
        
        let yearString:String = String(components.year!)
        let index = yearString.index(yearString.startIndex, offsetBy: 2)
        
        currentYear =  Int(yearString[index...])!
        currentMonth = components.month!
        
        if string == "" {
            return true
        }
        
        if proString.count == 1 && proString == "/"{
            return false
        }
        let exp = "^(\\d{1,2})?([\\/](\\d{1,2})?)?$"
        let regu = try? NSRegularExpression(pattern: exp, options: .caseInsensitive)
        let noofmatch: Int? = regu?.numberOfMatches(in: proString, options: [], range: NSRange(location: 0, length: proString.count))
        if noofmatch == 0 {
            if (proString == "") {
                return true
            }
            return false
        }
        
        if proString.count == 1 && Int(proString)! > 1 {
            if currentMonth > Int(proString)!{
                isMonthLessThanCurrentMonth = true
            }
            else
            {
                isMonthLessThanCurrentMonth = false
            }
            
            cardExpiryDateTxtFld.text = "0" + proString + "/"
            return false
        }
        
        if proString.count == 2 && Int(proString)! > 12 {
            return false
        }
        else if proString.count == 2 && Int(proString)! < 13 {
            if currentMonth > Int(proString)!{
                isMonthLessThanCurrentMonth = true
            }
            else
            {
                isMonthLessThanCurrentMonth = false
            }
            
            cardExpiryDateTxtFld.text = proString + "/"
            return false
        }
        
        var stringArray = proString.components(separatedBy: "/")
        if stringArray.count == 2 {
            if let secondValue = Int(stringArray[1]){
                if secondValue >= currentYear && stringArray[1].count == 2
                {
                    if isMonthLessThanCurrentMonth{
                        if secondValue > currentYear
                        {
                            return true
                        }else{
                            return true
                        }
                    }
                    else
                    {
                        return true
                    }
                }else if stringArray[1].count == 1
                {
                    return true
                }
                else
                {
                    return true
                }
            }
        }
        return true
    }
