//
//  main.swift
//  0706012110036-Evelyn Callista Yaurentius-AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var userInput: String = ""
var isLoop1:Bool = false
var nameCheck:Bool = false

var userName: String = ""
var userHP: Int = 100
var userMP: Int = 50
var userPotion: Int = 20

let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ")

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
               [H]eal your wounds with potion
               
               ...or choose where you want to go
               
               [F]orest of Troll
               [M]ountain of Golem
               [Q]uit game
               
               Your choice?
               """)
                        userInput=readLine()!
                        
                        if userInput.lowercased() == "c"{
                            isLoop1.toggle()
                            var isLoop2:Bool = false
                            repeat{
                                print("""
                     
                     Player name: \(userName)
                     
                     HP: \(userHP) / 100
                     MP: \(userMP) /50
                     
                     Magic:
                     - Physical Attack. No Mana required. Deal 5pt of damage.
                     - Meteor. Use 15pt of MP. Deal 50pt of damage.
                     - Shield. Use 10pt of MP. Block enemy's attack in 1 turn
                     
                     Items:
                     - Potion x10. Heal 20pt of your HP.
                     - Elixir x5. Add 10pt of your MP.
                     
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
                            if userPotion == 0{
                                repeat{
                                    print("""
                         You don't have any potion left. Be careful of your next journey.
                         Press [return] to go back
                         """)
                                    userInput=readLine()!
                                }while userInput != ""
                            }
                            else if userPotion != 0{
                                var isLoop2:Bool = false
                                repeat{
                                    print("""
                     
                     Your HP is \(userHP).
                     You have \(userPotion) potions.
                     
                     Are you sure want to use 1 potion to heal wound? [Y/N]
                     
                     """)
                                    userInput=readLine()!
                                    if userInput.lowercased() == "y" && userPotion != 0{
                                        userPotion -= 1
                                        userHP += 20
                                        if userHP > 100 {
                                            userHP = 100
                                        }
                                        if userPotion == 0{
                                            repeat{
                                                print("""
                                     You don't have any potion left. Be careful of your next journey.
                                     Press [return] to go back
                                     """)
                                                userInput=readLine()!
                                                if userInput == ""{
                                                    isLoop2.toggle()
                                                }
                                            }while userInput != ""
                                        }
                                    }else if userInput.lowercased() == "n"{
                                        isLoop2.toggle()
                                    }
                                }while isLoop2 == false
                            }
                        }
                        else if userInput.lowercased() == "f"{
                            var isLoop2:Bool = false
                            var trollHP:Int = 1000
                            repeat{
                                print("""
                     
                 As you enter the forest, you feel a sense of unease wash over you.
                 Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.
                     
                 Name: Troll x1
                 Health: \(trollHP)
                 
                 Choose your action:
                 [1] Physical Attack. No mana required. Deal 5pt of damage.
                 [2] Meteor. User 15pt of MP. Deal 50pt of damage.
                 [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
                 
                 [4] Use Potion to heal wound.
                 [5] Scan enemy's vital.
                 [6] Flee from battle.
                 
                 Your choice?
                 """)
                                userInput=readLine()!
                                if userInput == "1"{
                                    
                                }else if userInput == "2"{
                                    
                                }else if userInput == "3"{
                                    
                                }else if userInput == "4"{
                                    
                                }else if userInput == "5"{
                                    
                                }else if userInput == "6"{
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
                            var golemHP:Int = 1000
                            repeat{
                                print("""
                     
                 As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.
                 Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.
                     
                 Name: Golem x1
                 Health: \(golemHP)
                 
                 Choose your action:
                 [1] Physical Attack. No mana required. Deal 5pt of damage.
                 [2] Meteor. User 15pt of MP. Deal 50pt of damage.
                 [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
                 
                 [4] Use Potion to heal wound.
                 [5] Scan enemy's vital.
                 [6] Flee from battle.
                 
                 Your choice?
                 """)
                                userInput=readLine()!
                                if userInput == "1"{
                                    golemHP -= 5
                                }else if userInput == "2"{
                                    userMP -= 15
                                    golemHP -= 50
                                }else if userInput == "3"{
                                    userMP -= 10
                                }else if userInput == "4"{
                                    
                                }else if userInput == "5"{
                                    
                                }else if userInput == "6"{
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
                    }while isLoop1 == false;
                };
            }
        }while nameCheck == false
    }
}while userInput != "";
