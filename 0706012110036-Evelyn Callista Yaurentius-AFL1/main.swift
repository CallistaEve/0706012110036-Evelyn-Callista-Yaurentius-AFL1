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
        var moneyLeft = 0
        if money >= 5{
            self.quantity += 1
            moneyLeft = money - 5
            print("Thanks for your purchase!")
        }else{
            print("You don't have enough money to buy Elixir")
        }
        return moneyLeft
    }
    //    init(_ itemName: String, _ description: String,_ quantity:Int,_ money: Int, _ mp: Int){
    //        super.init(itemName, description, quantity, money)
    //    }
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
        var moneyLeft = 0
        if money >= 5{
            self.quantity += 1
            moneyLeft = money - 5
            print("Thanks for your purchase!")
        }else{
            print("You don't have enough money to buy \(itemName)")
        }
        return moneyLeft
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
    
    func attack(skillName: String, playerName: String, playerMp: Int, playerDamage: Int, enemy: String, enemyHP: Int)->(hpLeft: Int, mpLeft: Int, move: Int){
        var hpLeft: Int = enemyHP
        var mpLeft: Int = playerMp
        var move: Int = 1
        if skillName == "Meteor" || skillName == "Shield"{
            if playerMp <= 0{
                move = 0
                print ("""
                    ============= Player Turn =============
                    You ran out of Mana, can't use \(skillName)
                    Use Elixir to restore Mana
                    
                    Press [return] to go back:
        """)
                return (hpLeft, mpLeft, move)
            }else if playerMp < mp{
                move = 0
                print  ("""
            ============= Player Turn =============
            Your current mana : \(playerMp)
            Your Mana doesn't enough to cast \(skillName)
            Use Elixir to restore Mana
            
            Press [return] to go back:
            """
                        )
                return (hpLeft, mpLeft, move)
            }
        }
        if skillName == "Shield"{
            move = 0
            print("""
            ============= Player Turn =============
            \(playerName) use \(mp)pt Mana to use \(skillName) against \(enemy)
            It blocks an upcoming attack
            
            Press [return] to continue:
            """)
        }else{
            print("""
        ============= Player Turn =============
        \(playerName) use \(skillName) to \(enemy)
        It deals \(playerDamage)pt to \(enemy)
        """)
        }
        hpLeft = enemyHP - playerDamage
        mpLeft = playerMp - mp
        return (hpLeft, mpLeft, move)
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
    
    func attack(playerHP: Int)->Int{
        print("""
    ============= Enemy Turn =============
    \(name) deal \(damage)pt to player
    
    Press [return] to continue:
    """)
        let hpLeft = playerHP - damage
        return hpLeft
    }
//    func killed()->Int {
//        print("")
//        return prize
//    }
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
            [1] \(physicalAttack.description)
            [2] \(meteor.description)
            [3] \(shield.description)
                
            [4] Use \(userPotion.itemName) or \(userElixir.itemName) to heal wounds or restore MP.
            [5] \(run.description)
                
            Your choice?
        """)
    }
}


//Inisialisasi Monster dan Item
let userPotion = potion("Potion", "Restore 50pt of HP", 20, 0)
let userElixir = elixir("Elixir", "Restore 20pt of MP", 20, 0)

let run = playerSkill("Run", 0, 0, "Flee from battle.")
let physicalAttack = playerSkill("Physical Attack", 0, 5, "Physical Attack. No mana required. Deal 5pt of damage.")
let meteor = playerSkill("Meteor", 15, 50, "Meteor. Use 15pt of MP. Deal 50pt of damage.")
let shield = playerSkill("Shield", 10, 0, "Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")

//Variabel menyimpan inputan user
var userInput: String = ""

//Boolean untuk looping program menu utama
var isLoop1:Bool = false

//Error handling agar nama tidak menyimpan special input
let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ")
var nameCheck:Bool = false

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
    //Variabel yang menyimpan data pengguna
    var userName: String = ""
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
                     - \(physicalAttack.description).
                     - \(meteor.description).
                     - \(shield.description).
                     
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
                                        print(userPotion.checkPotion(userHP: player.hp, userPotion: userPotion.quantity))
                                        userInput=readLine()!
                                        if userPotion.quantity == 0{
                                            if userInput == ""{
                                                isLoop4.toggle()
                                            }
                                        }else if userPotion.quantity > 0{
                                            if userInput.lowercased() == "y" {
                                                userPotion.quantity -= 1
                                                player.hp += 20
                                                if player.hp > 100{
                                                    player.hp = 100
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
                                        print(userElixir.checkElixir(userMP: player.mp, userElixir: userElixir.quantity))
                                        userInput=readLine()!
                                        if userElixir.quantity == 0{
                                            if userInput == ""{
                                                isLoop4.toggle()
                                            }
                                        }else if userElixir.quantity > 0{
                                            if userInput.lowercased() == "y" {
                                                userElixir.quantity -= 1
                                                player.mp += 10
                                                if player.mp > 50{
                                                    player.mp = 50
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
                        else if userInput.lowercased() == "f" || userInput.lowercased() == "m"{
                            var isLoop2:Bool = false
                            
                            //                            Inisialisasi Enemy
                            let troll = enemy("Troll", 100, 5, 20, "As you enter the forest, you feel a sense of unease wash over you. \nSuddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.")
                            let golem = enemy("Golem", 150, 10, 50, "As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. \nSuddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.")
                            
                            var enemyType = troll
                            if userInput.lowercased() == "f"{
                                enemyType = troll
                            }else if userInput.lowercased() == "m"{
                                enemyType = golem
                            }
                            print(enemyType.encounterText)
                            repeat{
                                player.playerStatus()
                                print(enemyType.description)
                                player.listAction()
                                userInput=readLine()!
                                if userInput == "1" || userInput == "2" || userInput == "3"{
                                    var choosenAction = physicalAttack
                                    if userInput.lowercased() == "1"{
                                        choosenAction = physicalAttack
                                    }else if userInput.lowercased() == "2"{
                                        choosenAction = meteor
                                    }else if userInput.lowercased() == "3"{
                                        choosenAction = shield
                                    }
                                    repeat{
                                        let hasil = choosenAction.attack(skillName: choosenAction.name, playerName: player.name, playerMp: player.mp, playerDamage: choosenAction.damage, enemy: enemyType.name, enemyHP: enemyType.hp)
                                        player.mp = hasil.mpLeft
                                        enemyType.hp = hasil.hpLeft
                                        if hasil.move == 1{
                                            let playerHPLeft = enemyType.attack(playerHP: player.hp)
                                            player.hp = playerHPLeft
                                        }
                                        userInput=readLine()!
                                    }while userInput != ""
                                    if enemyType.hp <= 0 || player.hp <= 0{
                                        repeat{
                                            print(checkHP(enemyName:enemyType.name,userName: player.name, userHP: player.hp, enemyHP: enemyType.hp))
                                            userInput=readLine()!
                                        }while userInput != ""
                                        isLoop2.toggle()
                                        if enemyType.hp <= 0{
                                            repeat{
                                                print("""
                                        You defeat the \(enemyType.name), villagers pays \(enemyType.prize)$ for your service
                                        
                                              Press [return] to continue:
                                        """)
                                                userInput=readLine()!
                                            }while userInput != ""
                                            player.money += enemyType.prize
                                        }
                                        if player.hp == 0 {
                                            player.hp = 100
                                            player.mp = 50
                                        }
                                    }
                                }
                                else if userInput == "4"{
                                    var isLoop3:Bool = false
                                    repeat{
                                        player.playerStatus()
                                        player.listItem()
                                        
                                        userInput=readLine()!
                                        if userInput == "1" || userInput == "2" {
                                            var isLoop4:Bool = false
                                            repeat{
                                                print(userPotion.checkPotion(userHP: player.hp, userPotion: userPotion.quantity))
                                                userInput=readLine()!
                                                if userPotion.quantity == 0{
                                                    if userInput == ""{
                                                        isLoop4.toggle()
                                                    }
                                                }else if userPotion.quantity > 0{
                                                    if userInput.lowercased() == "y" {
                                                        userPotion.quantity -= 1
                                                        player.hp += 20
                                                        if player.hp > 100{
                                                            player.hp = 100
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
                                                print(userElixir.checkElixir(userMP: player.mp, userElixir: userElixir.quantity))
                                                userInput=readLine()!
                                                if userElixir.quantity == 0{
                                                    if userInput == ""{
                                                        isLoop4.toggle()
                                                    }
                                                }else if userElixir.quantity > 0{
                                                    if userInput.lowercased() == "y" {
                                                        userElixir.quantity -= 1
                                                        player.mp += 20
                                                        if player.mp > 50{
                                                            player.mp = 50
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
                                if userInput.lowercased() == "p" || userInput.lowercased() == "e"{
                                    var moneyLeft : Int = 0
                                    if userInput.lowercased() == "p"{
                                        moneyLeft = userPotion.buyPotion(money: player.money)
                                    }else if userInput.lowercased() == "e"{
                                        moneyLeft = userElixir.buyElixir(money: player.money)
                                    }
                                    player.money = moneyLeft
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
