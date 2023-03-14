//
//  main.swift
//  0706012110036-Evelyn Callista Yaurentius-AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

//Variabel menyimpan inputan user
var userInput: String = ""

//Boolean untuk looping program menu utama
var isLoop1:Bool = false

//Variabel yang menyimpan data pengguna
var userName: String = ""
var userInfo = ["userHP" : 100, "userMP" : 50, "userMoney" : 0,"userPotion" : 20,"userElixir" : 20]

//Error handling agar nama tidak menyimpan special input
let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ")
var nameCheck:Bool = false

//Variabel yang menyimpan data enemy
var enemyHP = ["Troll":100, "Golem":150]
var enemyAttack = ["Troll":5, "Golem":10]
var enemyPrize = ["Troll":20, "Golem":50]

//Function untuk mengeprint aksi yang dapat dilakukan user
func listAction(){
    print("""
    Choose your action:
        [1] Physical Attack. No mana required. Deal 5pt of damage.
        [2] Meteor. User 15pt of MP. Deal 50pt of damage.
        [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
            
        [4] Use Items
        [5] Flee from battle.
            
        Your choice?
    """)
}

//Function untuk menghasilkan output berupa teks berdasarkan jumlah potion yang dimiliki pengguna
func checkPotion(userHP: Int, userPotion:Int)->String{
    var text: String = ""
    if userPotion == 0{
        text="""
        You don't have any potion left. Be careful of your next journey.
        Press [return] to go back
        """
    }
    // If/Else untuk menghasilkan output berupa teks untuk konfirmasi penggunaan potion
    else{
        text="""
         Your HP is \(userHP).
         You have \(userPotion) potions.
         
         Are you sure want to use 1 potion to heal wound? [Y/N]
         """
    }
    return text
}

//Function untuk menghasilkan output berupa teks berdasarkan jumlah elixir yang dimiliki pengguna
func checkElixir(userMP: Int, userElixir:Int)->String{
    var text: String = ""
    if userElixir == 0{
        text="""
        You don't have any elixir left. Be careful of your next journey.
        Press [return] to go back
        """
    }
    // If/Else untuk menghasilkan output berupa teks untuk konfirmasi penggunaan elixir
    else{
        text="""
         Your MP is \(userMP).
         You have \(userElixir) elixirs.
         
         Are you sure want to use 1 elixir to restore mana? [Y/N]
         """
    }
    return text
}

//Function untuk menghasilkan text berdasarkan jumlah Mana Point(MP) yang dimiliki pengguna ketika ingin menggunakan Meteor/Shield
func checkMP(MagicorShield:String, userMP:Int, userName:String)->String{
    var text: String = ""
    if MagicorShield == "m"{
        if userMP == 0{
            text = """
            You ran out of Mana, can't use magic
            Use Elixir to restore Mana
            
            Press [return] to go back:
            """
        }
        else if userMP < 15 && userMP > 0{
            text = """
            Your current mana : \(userMP)
            Your Mana doesn't enough to cast Meteor
            Use Elixir to restore Mana
            
            Press [return] to go back:
            """
        }
        else if userMP > 15{
            text = """
            \(userName) use 15pt Mana to deal Meteor against Troll
            It deals 50pt damage to Troll
            Troll deal 5pt to player
            """
        }
    }else if MagicorShield == "s"{
        if userMP == 0{
            text = """
            You ran out of Mana, can't use shield
            Use Elixir to restore Mana
            
            Press [return] to go back:
            """
        }
        else if userMP < 15 && userMP > 0{
            text = """
            Your current mana : \(userMP)
            Your Mana doesn't enough to use shield
            Use Elixir to restore Mana
            
            Press [return] to go back:
            """
        }
        else if userMP > 10{
            text = """
            \(userName) use 10pt Mana to use shield against Troll
            It blocks an upcoming attack
            """
        }
    }
    
    return text
}
//Function untuk menghasilkan text berdasarkan jumlah Health Point(HP) yang dimiliki pengguna untuk menghasilkan output hasil battle
func checkHP(enemyName:String, userName:String, userHP:Int, enemyHP:Int)->String{
    var text: String = ""
    if enemyHP <= 0{
        text = """
    Congratulations!! You just defeat the \(enemyName)
"""
    }else if userHP <= 0{
        text = """
    Game Over!!
    \(userName) ran out of HP!!
    You flee from the battle and went to the hospitals
    \(userName) HP and MP restored
"""
    }
    return text
}

//Function untuk menghasilkan teks ketika user memilih opsi lari
func run(){
    print("""
You feel that if you don't escape soon, you won't be able to continue the fight.
You look around frantically, searching for a way out. You sprint towards the exit, your heart punding in your chest.

You're safe, for now.
Press [return] to continue:

""")
}

repeat {
    print("""
      
      Welcome to the world of magic!
      
      You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests, mountains, and dungeons, where you will face challenges, make allies, and fight enemies.
      
      Press [return] to continue:
      """)
    userInput=readLine()!
    if userInput.lowercased() == ""{
        repeat{
            print("\nMay I know your name, a young wizard?")
            
            userName=readLine()!
            do {
                let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
                if regex.firstMatch(in: userName, options: [], range: NSMakeRange(0, userName.count)) != nil {
                    print("Must not included number or special character")
                    
                } else {
                    print("\nNice to meet you \(userName)!")
                    
                    repeat {
                        print("""
               
               From here, you can...
               
               [C]heck your health and stats
               [U]se Items
               [B]uy Items
               
               ...or choose where you want to go
               
               [F]orest of Troll
               [M]ountain of Golem
               [Q]uit game
               
               Your choice?
               """)
                        userInput=readLine()!
                        
                        if userInput.lowercased() == "c"{
                            isLoop1.toggle()
                            //Boolean untuk looping program menu kedua
                            var isLoop2:Bool = false
                            repeat{
                                print("""
                     
                     Player name: \(userName)
                     
                     HP:  100 / \(userInfo["userHP"]!)
                     MP:  50 / \(userInfo["userMP"]!)
                     Money: \(userInfo["userMoney"]!)$
                     
                     Magic:
                     - Physical Attack. No Mana required. Deal 5pt of damage.
                     - Meteor. Use 15pt of MP. Deal 50pt of damage.
                     - Shield. Use 10pt of MP. Block enemy's attack in 1 turn
                     
                     Items:
                     - Potion x\(userInfo["userPotion"]!). Heal 20pt of your HP.
                     - Elixir x\(userInfo["userElixir"]!). Add 10pt of your MP.
                     
                     Press [return] to go back:
                     
                     """)
                                userInput=readLine()!
                                if userInput.lowercased() == ""{
                                    isLoop1.toggle()
                                    isLoop2.toggle()
                                }
                            }while isLoop2 == false
                        }
                        
                        else if userInput.lowercased() == "u"{
                            //Boolean untuk looping program menu ketiga
                            var isLoop3:Bool = false
                            repeat{
                                print("""
                                Player Name :\(userName)
                                Player Health :\(userInfo["userHP"]!)
                                Player Mana :\(userInfo["userMP"]!)
                                
                                Your items:
                                [1].Potion = \(userInfo["userPotion"]!)
                                [2].Elixir = \(userInfo["userElixir"]!)
                                [3].Close the bag
                                                                        
                                Which item do you want to use?
                                """)
                                userInput=readLine()!
                                if userInput == "1" {
                                    //Boolean untuk looping program menu keempat
                                    var isLoop4:Bool = false
                                    repeat{
                                        print(checkPotion(userHP: userInfo["userHP"]!, userPotion: userInfo["userPotion"]!))
                                        userInput=readLine()!
                                        if userInfo["userPotion"]! == 0{
                                            if userInput == ""{
                                                isLoop4.toggle()
                                            }
                                        }else if userInfo["userPotion"]! > 0{
                                            if userInput.lowercased() == "y" {
                                                userInfo["userPotion"]! -= 1
                                                userInfo["userHP"]! += 20
                                                if userInfo["userHP"]! > 100{
                                                    userInfo["userHP"]! = 100
                                                }
                                            }else if userInput.lowercased() == "n"{
                                                isLoop4.toggle()
                                            }
                                        }
                                    }while isLoop4 == false
                                }else if userInput == "2"{
                                    //Boolean untuk looping program menu keempat
                                    var isLoop4:Bool = false
                                    repeat{
                                        print(checkElixir(userMP: userInfo["userMP"]!, userElixir: userInfo["userElixir"]!))
                                        userInput=readLine()!
                                        if userInfo["userElixir"]! == 0{
                                            if userInput == ""{
                                                isLoop4.toggle()
                                            }
                                        }else if userInfo["userElixir"]! > 0{
                                            if userInput.lowercased() == "y" {
                                                userInfo["userElixir"]! -= 1
                                                userInfo["userMP"]! += 10
                                                if userInfo["userMP"]! > 50{
                                                    userInfo["userMP"]! = 50
                                                }
                                            }else if userInput.lowercased() == "n"{
                                                isLoop4.toggle()
                                            }
                                        }
                                    }while isLoop4 == false
                                }else if userInput == "3"{
                                    isLoop3.toggle()
                                }
                            }while isLoop3 == false
                        }
                        else if userInput.lowercased() == "f"{
                            var isLoop2:Bool = false
                            var enemyHP:Int = enemyHP["Troll"]!
                            let enemyAttack:Int = enemyAttack["Troll"]!
                            let enemyPrize: Int = enemyPrize["Troll"]!
                            repeat{
                                print("""
                     
                 As you enter the forest, you feel a sense of unease wash over you.
                 Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.
                    
                 Player Name :\(userName)
                 Player Health :\(userInfo["userHP"]!)
                 Player Mana :\(userInfo["userMP"]!)
                 Player Money :\(userInfo["userMoney"]!)
                 
                 Name: Troll x1
                 Health: \(enemyHP)
                 Attack Power: \(enemyAttack)\n
                 """)
                                listAction()
                                userInput=readLine()!
                                if userInput == "1"{
                                    repeat{
                                        print("""
                                \(userName) use Physical Attack to Troll
                                It deals 5pt to Troll
                                Troll deal \(enemyAttack)pt to player
                                """)
                                        userInput=readLine()!
                                    }while userInput != ""
                                    userInfo["userHP"]! -= enemyAttack
                                    enemyHP -= 5
                                    if enemyHP <= 0 || userInfo["userHP"]! <= 0{
                                        repeat{
                                            print(checkHP(enemyName:"Troll",userName: userName, userHP: userInfo["userHP"]!, enemyHP: enemyHP))
                                            userInput=readLine()!
                                        }while userInput != ""
                                        isLoop2.toggle()
                                        if enemyHP <= 0{
                                            repeat{
                                                print("""
                                        You defeat the Troll, villagers pays \(enemyPrize)$ for your service
                                        """)
                                                userInput=readLine()!
                                            }while userInput != ""
                                            userInfo["userMoney"]! += enemyPrize
                                        }
                                        if userInfo["userHP"]! == 0 {
                                            userInfo["userHP"]! = 100
                                            userInfo["userMP"]! = 50
                                        }
                                    }
                                }else if userInput == "2"{
                                    repeat{
                                        print(checkMP(MagicorShield: "m",userMP: userInfo["userMP"]!, userName: userName))
                                        userInput=readLine()!
                                        if userInfo["userMP"]! > 15 {
                                            userInfo["userHP"]! -= enemyAttack
                                            userInfo["userMP"]! -= 15
                                            enemyHP -= 50
                                        }
                                    }while userInput != ""
                                    if enemyHP <= 0 || userInfo["userHP"]! <= 0{
                                        repeat{
                                            print(checkHP(enemyName:"Troll", userName: userName, userHP: userInfo["userHP"]!, enemyHP: enemyHP))
                                            userInput=readLine()!
                                        }while userInput != ""
                                        isLoop2.toggle()
                                        if enemyHP <= 0{
                                            repeat{
                                                print("""
                                        You defeat the Troll, villagers pays \(enemyPrize)$ for your service
                                        """)
                                                userInput=readLine()!
                                            }while userInput != ""
                                            userInfo["userMoney"]! += enemyPrize
                                        }
                                        if userInfo["userHP"]! == 0 {
                                            userInfo["userHP"]! = 100
                                            userInfo["userMP"]! = 50
                                        }
                                    }
                                }else if userInput == "3"{
                                    repeat{
                                        print(checkMP(MagicorShield: "s",userMP: userInfo["userMP"]!, userName: userName))
                                        userInput=readLine()!
                                    }while userInput != ""
                                    if userInfo["userMP"]! > 10 {
                                        userInfo["userMP"]! -= 10
                                    }
                                    
                                }else if userInput == "4"{
                                    var isLoop3:Bool = false
                                    repeat{
                                        print("""
                                        Player Name :\(userName)
                                        Player Health :\(userInfo["userHP"]!)
                                        Player Mana :\(userInfo["userMP"]!)
                                                                        
                                        Your items:
                                        [1].Potion = \(userInfo["userPotion"]!)
                                        [2].Elixir = \(userInfo["userElixir"]!)
                                        [3].Close the bag
                                                                                                                
                                        Which item do you want to use?
                                        """)
                                        userInput=readLine()!
                                        if userInput == "1" {
                                            var isLoop4:Bool = false
                                            repeat{
                                                print(checkPotion(userHP: userInfo["userHP"]!, userPotion: userInfo["userPotion"]!))
                                                userInput=readLine()!
                                                if userInfo["userPotion"]! == 0{
                                                    if userInput == ""{
                                                        isLoop4.toggle()
                                                    }
                                                }else if userInfo["userPotion"]! > 0{
                                                    if userInput.lowercased() == "y" {
                                                        userInfo["userPotion"]! -= 1
                                                        userInfo["userHP"]! += 20
                                                        if userInfo["userHP"]! > 100{
                                                            userInfo["userHP"]! = 100
                                                        }
                                                    }else if userInput.lowercased() == "n"{
                                                        isLoop4.toggle()
                                                    }
                                                }
                                            }while isLoop4 == false
                                        }else if userInput == "2"{
                                            var isLoop4:Bool = false
                                            repeat{
                                                print(checkElixir(userMP: userInfo["userMP"]!, userElixir: userInfo["userElixir"]!))
                                                userInput=readLine()!
                                                if userInfo["userElixir"]! == 0{
                                                    if userInput == ""{
                                                        isLoop4.toggle()
                                                    }
                                                }else if userInfo["userElixir"]! > 0{
                                                    if userInput.lowercased() == "y" {
                                                        userInfo["userElixir"]! -= 1
                                                        userInfo["userMP"]! += 20
                                                        if userInfo["userMP"]! > 50{
                                                            userInfo["userMP"]! = 50
                                                        }
                                                    }else if userInput.lowercased() == "n"{
                                                        isLoop4.toggle()
                                                    }
                                                }
                                            }while isLoop4 == false
                                        }else if userInput == "3"{
                                            isLoop3.toggle()
                                        }
                                    }while isLoop3 == false
                                }else if userInput == "5"{
                                    repeat{
                                        run()
                                        userInput=readLine()!
                                        if userInput == ""{
                                            isLoop2.toggle()
                                        }
                                    }while userInput != ""
                                }
                            }while isLoop2 == false
                        }
                        else if userInput.lowercased() == "m"{
                            var isLoop2:Bool = false
                            var enemyHP:Int = enemyHP["Golem"]!
                            let enemyAttack:Int = enemyAttack["Golem"]!
                            let enemyPrize: Int = enemyPrize["Golem"]!
                            repeat{
                                print("""
                     
                 As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.
                 Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.
                 
                Player Name :\(userName)
                Player Health :\(userInfo["userHP"]!)
                Player Mana :\(userInfo["userMP"]!)
                Player Money :\(userInfo["userMoney"]!)
                                  
                Name: Golem x1
                Health: \(enemyHP)
                Attack Power: \(enemyAttack)\n
                """)
                                listAction()
                                userInput=readLine()!
                                if userInput == "1"{
                                    repeat{
                                        print("""
                                \(userName) use Physical Attack to Golem
                                It deals 5pt to Golem
                                Troll deal \(enemyAttack)pt to player
                                """)
                                        userInput=readLine()!
                                    }while userInput != ""
                                    userInfo["userHP"]! -= enemyAttack
                                    enemyHP -= 5
                                    if enemyHP <= 0 || userInfo["userHP"]! <= 0{
                                        repeat{
                                            print(checkHP(enemyName:"Golem", userName: userName, userHP: userInfo["userHP"]!, enemyHP: enemyHP))
                                            userInput=readLine()!
                                        }while userInput != ""
                                        isLoop2.toggle()
                                        if enemyHP <= 0{
                                            repeat{
                                                print("""
                                        You defeat the Golem, villagers pays \(enemyPrize)$ for your service
                                        """)
                                                userInput=readLine()!
                                            }while userInput != ""
                                            userInfo["userMoney"]! += 20
                                        }
                                        if userInfo["userHP"]! == 0 {
                                            userInfo["userHP"]! = 100
                                            userInfo["userMP"]! = 50
                                        }
                                    }
                                }else if userInput == "2"{
                                    repeat{
                                        print(checkMP(MagicorShield: "m",userMP: userInfo["userMP"]!, userName: userName))
                                        userInput=readLine()!
                                        if userInfo["userMP"]! > 15 {
                                            userInfo["userHP"]! -= enemyAttack
                                            userInfo["userMP"]! -= 15
                                            enemyHP -= 50
                                        }
                                    }while userInput != ""
                                    if enemyHP <= 0 || userInfo["userHP"]! <= 0{
                                        repeat{
                                            print(checkHP(enemyName:"Golem", userName: userName, userHP: userInfo["userHP"]!, enemyHP: enemyHP))
                                            userInput=readLine()!
                                        }while userInput != ""
                                        isLoop2.toggle()
                                        if enemyHP <= 0{
                                            repeat{
                                                print("""
                                        You defeat the Golem, villagers pays \(enemyPrize)$ for your service
                                        """)
                                                userInput=readLine()!
                                            }while userInput != ""
                                            userInfo["userMoney"]! += enemyPrize
                                        }
                                        if userInfo["userHP"]! == 0 {
                                            userInfo["userHP"]! = 100
                                            userInfo["userMP"]! = 50
                                        }
                                    }
                                }else if userInput == "3"{
                                    repeat{
                                        print(checkMP(MagicorShield: "s",userMP: userInfo["userMP"]!, userName: userName))
                                        userInput=readLine()!
                                    }while userInput != ""
                                    if userInfo["userMP"]! > 10 {
                                        userInfo["userMP"]! -= 10
                                    }
                                }else if userInput == "4"{
                                    var isLoop3:Bool = false
                                    repeat{
                                        print("""
                                        Player Name :\(userName)
                                        Player Health :\(userInfo["userHP"]!)
                                        Player Mana :\(userInfo["userMP"]!)
                                                                        
                                        Your items:
                                        [1].Potion = \(userInfo["userPotion"]!)
                                        [2].Elixir = \(userInfo["userElixir"]!)
                                        [3].Close the bag
                                                                                                                
                                        Which item do you want to use?
                                        """)
                                        userInput=readLine()!
                                        if userInput == "1" {
                                            var isLoop4:Bool = false
                                            repeat{
                                                print(checkPotion(userHP: userInfo["userHP"]!, userPotion: userInfo["userPotion"]!))
                                                userInput=readLine()!
                                                if userInfo["userPotion"]! == 0{
                                                    if userInput == ""{
                                                        isLoop4.toggle()
                                                    }
                                                }else if userInfo["userPotion"]! > 0{
                                                    if userInput.lowercased() == "y" {
                                                        userInfo["userPotion"]! -= 1
                                                        userInfo["userHP"]! += 20
                                                        if userInfo["userHP"]! > 100{
                                                            userInfo["userHP"]! = 100
                                                        }
                                                    }else if userInput.lowercased() == "n"{
                                                        isLoop4.toggle()
                                                    }
                                                }
                                            }while isLoop4 == false
                                        }else if userInput == "2"{
                                            var isLoop4:Bool = false
                                            repeat{
                                                print(checkElixir(userMP: userInfo["userMP"]!, userElixir: userInfo["userElixir"]!))
                                                userInput=readLine()!
                                                if userInfo["userElixir"]! == 0{
                                                    if userInput == ""{
                                                        isLoop4.toggle()
                                                    }
                                                }else if userInfo["userElixir"]! > 0{
                                                    if userInput.lowercased() == "y" {
                                                        userInfo["userElixir"]! -= 1
                                                        userInfo["userMP"]! += 20
                                                        if userInfo["userMP"]! > 50{
                                                            userInfo["userMP"]! = 50
                                                        }
                                                    }else if userInput.lowercased() == "n"{
                                                        isLoop4.toggle()
                                                    }
                                                }
                                            }while isLoop4 == false
                                        }else if userInput == "3"{
                                            isLoop3.toggle()
                                        }
                                    }while isLoop3 == false
                                }else if userInput == "5"{
                                    repeat{
                                        run()
                                        userInput=readLine()!
                                        if userInput == ""{
                                            isLoop2.toggle()
                                        }
                                    }while userInput != ""
                                }
                            }while isLoop2 == false
                        }
                        else if userInput.lowercased() == "q"{
                            exit(0)
                        }
                        else if userInput.lowercased() == "b"{
                            var isLoop2:Bool = false
                            repeat{
                                print("""
                                Welcome to the Market!
                                Which items do you want to buy?
                                
                                    [P]otions 1x 5$
                                    [E]lixir 1x 5$
                                    [L]eave
                                
                                """)
                                userInput=readLine()!
                                if userInput.lowercased() == "p"{
                                    if userInfo["userMoney"]! >= 5{
                                        userInfo["userPotion"]! += 1
                                        userInfo["userMoney"]! -= 5
                                        print("Thanks for your purchase!")
                                    }else{
                                        print("You don't have enough money to buy potion")
                                    }
                                }
                                else if userInput.lowercased() == "e"{
                                    if userInfo["userMoney"]! >= 5{
                                        userInfo["userElixir"]! += 1
                                        userInfo["userMoney"]! -= 5
                                        repeat{
                                            print("""
                                            Thanks for your purchase!
                                            Do you want to buy another item? (y/n)
                                            """)
                                            userInput=readLine()!
                                        }while userInput.lowercased() != "y" && userInput.lowercased() != "n"
                                        if userInput.lowercased() == "n"{
                                            print("Come again soon!")
                                            isLoop2.toggle()
                                        }
                                    }else{
                                        print("You don't have enough money to buy elixir")
                                    }
                                }
                                else if userInput.lowercased() == "l"{
                                    print("Come again soon!")
                                    isLoop2.toggle()
                                }
                            }while isLoop2 == false
                        }
                    }while isLoop1 == false;
                };
            }
        }while nameCheck == false
    }
}while userInput != "";
