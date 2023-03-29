//
//  main.swift
//  0706012110036-Evelyn Callista Yaurentius-AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

class playerItem {
    var itemName: String=""
    var description: String = ""
    var quantity: Int = 0
    var money: Int = 0
    
    init(_ itemName:String, _ description:String ,_ quantity:Int,_ money:Int){
        self.itemName = itemName
        self.description = description
        self.quantity = quantity
        self.money = money
    }
}

class elixir: playerItem{
    var mp:Int = 0
    
    func useElixir(playerName: String, playerMP: Int)->(quantity: Int, playerMP: Int){
        let playerMP = playerMP+20
        self.quantity -= 1
        print("\(playerName) use Elixir, Elixir left \(quantity)")
        return (quantity, playerMP)
    }
    func buyElixir(money: Int)->Int{
        if money > 5{
            self.quantity += 1
            self.money -= 5
        }else{
            print("You don't have enough money to buy Elixir")
        }
        return quantity
    }
    //    init(_ itemName: String, _ description: String,_ quantity:Int,_ money: Int, _ mp: Int){
    //        super.init(itemName, description, quantity, money)
    //    }
    
}

class potion: playerItem{
    var hp:Int = 0
    
    func usePotion(playerName:String, playerHP:Int)->Int{
        self.hp = hp+20
        self.quantity -= 1
        print("\(playerName) use \(itemName), \(itemName) left \(quantity)")
        return quantity
    }
    func buyPotion(money: Int)->Int{
        if money > 5{
            self.quantity += 1
            self.money -= 5
            
        }else{
            print("You don't have enough money to buy \(itemName)")
        }
        return quantity
    }
    
}

class playerSkill{
    var name: String=""
    var description: String=""
    var mp: Int=0
    var damage: Int=0
    
    init(_ name:String, _ mp:Int ,_ damage:Int,_ description:String){
        self.name = name
        self.mp = mp
        self.damage = damage
        self.description = description
    }
    
    func physicalAttack(){
        
    }
    func meteor(){
        
    }
    func shield(){
        
    }
    func attack(skillName: String, playerName: String, playerDamage: Int, enemy: String, enemyHP: Int)->Int{
        print("""
    \(playerName) use \(skillName) to \(enemy)
    It deals \(playerDamage)pt to \(enemy)
    """)
        var hpLeft = enemyHP - playerDamage
        return hpLeft
    }
    func run(){
        print("""
    You feel that if you don't escape soon, you won't be able to continue the fight.
    You look around frantically, searching for a way out. You sprint towards the exit, your heart punding in your chest.
    
    You're safe, for now.
    Press [return] to continue:
    
    """)
    }
    
}

class enemy{
    var name: String = ""
    var hp: Int = 0
    var damage: Int = 0
    var prize: Int = 0
    var encounterText: String = ""
    var description: String{
        return """
                Name: \(name) x1
                Health: \(hp)
                Attack Power: \(damage)\n
                """
    }
    
    init(_ name:String, _ hp:Int ,_ damage:Int,_ prize:Int, _ encounterText: String){
        self.name = name
        self.hp = hp
        self.damage = damage
        self.prize = prize
        self.encounterText = encounterText
    }
    
    func status(){
        
    }
    
    func attack(playerHP: Int)->Int{
        print("""
    \(name) deal \(damage)pt to player

    Press [return] to continue:
    """)
        var hpLeft = playerHP - damage
        return hpLeft
    }
    func getAttacked(hpLeft: Int){
        self.hp = hpLeft
    }
    func killed()->Int {
        print("")
        return prize
    }
}

class player{
    var name: String = ""
    var hp: Int = 0
    var mp: Int = 0
    var money: Int = 0
    var playerItem : [playerItem] = []
    var playerSkill : [playerSkill] = []
    
    init(_ name:String){
        self.name = name
        hp = 100
        mp = 50
        money = 0
    }
    func getAttacked(hpLeft: Int){
        self.hp = hpLeft
    }
    func playerStatus(){
        print("""
        
        Player Name :\(name)
        Player Health :\(hp)
        Player Mana :\(mp)
        Player Money :\(money)
        
        """)
    }
    func listItem(){
        print("""
        
        Your items:
        [1].Potion = \(userPotion.quantity)
        [2].Elixir = \(userElixir.quantity)
        [3].Close the bag
                                                                                        
        Which item do you want to use?
        """)
    }
    func listAction(){
        print("""
        Choose your action:
            [1] \(physicalAttack.name). \(physicalAttack.description)
            [2] \(meteor.name). \(meteor.description)
            [3] \(shield.name). \(shield.description)
                
            [4] Use \(userPotion.itemName) or \(userElixir.itemName) to heal wounds or restore MP.
            [5] \(run.description)
                
            Your choice?
        """)
    }
}


//Inisialisasi Monster dan Item
let userPotion = potion("Potion", "Restore 50pt of HP", 20, 0)
let userElixir = elixir("Elixir", "Restore 20pt of MP", 20, 0)
let troll = enemy("Troll", 100, 5, 20, "As you enter the forest, you feel a sense of unease wash over you. \nSuddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.")
let golem = enemy("Golem", 150, 10, 50, "As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. \nSuddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
let run = playerSkill("Run", 0, 0, "Flee from battle.")
let physicalAttack = playerSkill("Physical Attack", 0, 5, "Physical Attack. No mana required. Deal 5pt of damage.")
let meteor = playerSkill("Meteor", 15, 50, "Meteor. Use 15pt of MP. Deal 50pt of damage.")
let shield = playerSkill("Shield", 10, 0, "Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")

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
            
            Press [return] to continue:
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
            
            Press [return] to continue:
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

    Press [return] to continue:
"""
    }else if userHP <= 0{
        text = """
    Game Over!!
    \(userName) ran out of HP!!
    You flee from the battle and went to the hospitals
    \(userName) HP and MP restored

    Press [return] to continue:
"""
    }
    return text
}

//Function untuk menghasilkan teks ketika user memilih opsi yang tidak tersedia
func wrongInput(){
    print("""
Please Enter The Correct Input

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
            repeat{
                print("\nMay I know your name, a young wizard?")
                
                userName=readLine()!
            }while userName == ""
            
            do {
                let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
                if regex.firstMatch(in: userName, options: [], range: NSMakeRange(0, userName.count)) != nil {
                    print("Must not included number or special character")
                    
                } else {
                    let player = player(userName)
                    print("\nNice to meet you \(player.name)!")
                    
                    repeat {
                        print("""
               
               From here, you can...
               
               [C]heck your health and stats
               [H]eal or Restore Your Wounds with Items
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
                     
                     Player name: \(player.name)
                     
                     HP:  100 / \(player.hp)
                     MP:  50 / \(player.mp)
                     Money: \(player.money)$
                     
                     Action:
                     - \(physicalAttack.name). \(physicalAttack.description).
                     - \(meteor.name). \(meteor.description).
                     - \(shield.name). \(shield.description).
                     
                     Items:
                     - \(userPotion.itemName) x\(userPotion.quantity). \(userPotion.description)
                     - \(userElixir.itemName) x\(userElixir.quantity). \(userElixir.description).
                     
                     Press [return] to go back:
                     
                     """)
                                userInput=readLine()!
                                if userInput.lowercased() == ""{
                                    isLoop1.toggle()
                                    isLoop2.toggle()
                                }
                            }while isLoop2 == false
                        }
                        
                        else if userInput.lowercased() == "h"{
                            //Boolean untuk looping program menu ketiga
                            var isLoop3:Bool = false
                            repeat{
                                player.playerStatus()
                                player.listItem()
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
                                            }else{
                                                repeat{
                                                    wrongInput()
                                                    userInput=readLine()!
                                                }while userInput != ""
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
                                            }else{
                                                repeat{
                                                    wrongInput()
                                                    userInput=readLine()!
                                                }while userInput != ""
                                            }
                                        }
                                    }while isLoop4 == false
                                }else if userInput == "3"{
                                    isLoop3.toggle()
                                }else{
                                    repeat{
                                        wrongInput()
                                        userInput=readLine()!
                                    }while userInput != ""
                                }
                            }while isLoop3 == false
                        }
                        else if userInput.lowercased() == "f"{
                            var isLoop2:Bool = false
                            var enemyHP:Int = enemyHP["Troll"]!
                            let enemyAttack:Int = enemyAttack["Troll"]!
                            let enemyPrize: Int = enemyPrize["Troll"]!
                            repeat{
                                print(troll.encounterText)
                                player.playerStatus()
                                print(troll.description)
                                //                                Cek
                                player.listAction()
                                userInput=readLine()!
                                if userInput == "1"{
//                                    func attack(attackChoice: Int, playerName: String, playerDamage: Int, enemy: String)
                                    repeat{
                                        var reduceEnemyHP = physicalAttack.attack(skillName: physicalAttack.name, playerName: player.name, playerDamage: physicalAttack.damage, enemy: troll.name, enemyHP: troll.hp)
                                        troll.getAttacked(hpLeft: reduceEnemyHP)
                                        var reducePlayerHP = troll.attack(playerHP: player.hp)
                                        player.getAttacked(hpLeft: reducePlayerHP)
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
                                        
                                              Press [return] to continue:
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
                                        
                                              Press [return] to continue:
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
                                        player.playerStatus()
                                        player.listItem()
                                        
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
                                                    }else{
                                                        repeat{
                                                            wrongInput()
                                                            userInput=readLine()!
                                                        }while userInput != ""
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
                                                    }else{
                                                        repeat{
                                                            wrongInput()
                                                            userInput=readLine()!
                                                        }while userInput != ""
                                                    }
                                                }
                                            }while isLoop4 == false
                                        }else if userInput == "3"{
                                            isLoop3.toggle()
                                        }else{
                                            repeat{
                                                wrongInput()
                                                userInput=readLine()!
                                            }while userInput != ""
                                        }
                                    }while isLoop3 == false
                                }else if userInput == "5"{
                                    repeat{
                                        run.run()
                                        userInput=readLine()!
                                        if userInput == ""{
                                            isLoop2.toggle()
                                        }
                                    }while userInput != ""
                                }else{
                                    repeat{
                                        wrongInput()
                                        userInput=readLine()!
                                    }while userInput != ""
                                }
                            }while isLoop2 == false
                        }
                        else if userInput.lowercased() == "m"{
                            var isLoop2:Bool = false
                            //                            3 baris dibawah kemungkinan dihapus, Cek
                            var enemyHP:Int = golem.hp
                            let enemyAttack:Int = golem.damage
                            let enemyPrize: Int = golem.prize
                            repeat{
                                print(golem.encounterText)
                                player.playerStatus()
                                print(golem.description)
                                player.listAction()
                                userInput=readLine()!
                                if userInput == "1"{
                                    repeat{
                                        print("""
                                \(player.name) use Physical Attack to Golem
                                It deals 5pt to Golem
                                Troll deal \(golem.damage)pt to player
                                
                                      Press [return] to continue:
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
                                        
                                              Press [return] to continue:
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
                                        
                                              Press [return] to continue:
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
                                        player.playerStatus()
                                        player.listItem()
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
                                                    }else{
                                                        repeat{
                                                            wrongInput()
                                                            userInput=readLine()!
                                                        }while userInput != ""
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
                                                    }else{
                                                        repeat{
                                                            wrongInput()
                                                            userInput=readLine()!
                                                        }while userInput != ""
                                                    }
                                                }
                                            }while isLoop4 == false
                                        }else if userInput == "3"{
                                            isLoop3.toggle()
                                        }else{
                                            repeat{
                                                wrongInput()
                                                userInput=readLine()!
                                            }while userInput != ""
                                        }
                                    }while isLoop3 == false
                                }else if userInput == "5"{
                                    repeat{
                                        run.run()
                                        userInput=readLine()!
                                        if userInput == ""{
                                            isLoop2.toggle()
                                        }
                                    }while userInput != ""
                                }else{
                                    repeat{
                                        wrongInput()
                                        userInput=readLine()!
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
                                        print("Thanks for your purchase!")
                                    }else{
                                        print("You don't have enough money to buy elixir")
                                    }
                                }
                                else if userInput.lowercased() == "l"{
                                    print("Come again soon")
                                    isLoop2.toggle()
                                }else{
                                    repeat{
                                        wrongInput()
                                        userInput=readLine()!
                                    }while userInput != ""
                                }
                            }while isLoop2 == false
                        }else{
                            repeat{
                                wrongInput()
                                userInput=readLine()!
                            }while userInput != ""
                        }
                    }while isLoop1 == false;
                };
            }
        }while nameCheck == false
    }
}while userInput != "";
