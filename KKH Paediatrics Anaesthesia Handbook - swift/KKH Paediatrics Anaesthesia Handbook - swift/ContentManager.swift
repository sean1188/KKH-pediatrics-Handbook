//
//  ContentManager.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 3/4/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class ContentManager: NSObject {
    
    static var BasicLifeSupport : [[String : Any]] = [
        
        ["Steps" : ["type" : "checkList_BLS"]],
        
        
        ["Pulse Present, Breathing absent" : ["type" : "text",
                                              "content" : " 1 Breath every 3 seconds \n(Breathe a thousand, 2 a thousand, 3 a thousand then repeat cycle) \n\nRe-check pulse every 2 minutes"]],
        
        ["Pulse Absent, Breathing absent" : ["type" : "text",
                                             "content" : " Lone rescuer: complete 2 minutes (5 cycles) of CPR before calling EMS\n\nSned someone to call EMS immediately if not alone"]],
        
        ["Single Rescuer" : ["type" : "text",
                             "content" : " 30 compressions : 2 breaths"]],
        
        ["Healthcare Provider: Team Resuscitation" : ["type" : "text",
                                                      "content" : " No advanced airway- 15 compressions : 2 breaths \n\n Advanced airway (LMA/ ETT)-  provide 100 compressions & 10 ventilations per minute \n\n Push Hard Push Fast \n\n Minimise interruptions to compressions \n\n Rotate roles to avoid fatigue \n\n Recheck pulse every 2 minutes"]]]
    
    
    static func anaphylaxisContent ( weight : Float) -> [[String : Any]] {
        return [["Signs" : ["type" : "text",
                            "content" :  "Erythema\nUrticaria\nAngioedema\nHypotension\nTachycardia\nDysrrhythmias\nCirculatory Collapse"]],
                ["Symptoms" :  ["type" : "text",
                                "content" : "Dyspnoea\nWheezing"]],
                ["Immediate Treatment" : ["type" : "checkList_anap1"]],
                ["Remove Possible triggers" : ["type" : "checkList_anap2"]],
                
                ["Immediate Treatment Drugs" : ["type" : "header"]],
                ["NS/RL IV BOLUS - 10ML/KG" :  ["type" : "text",
                                                "content" : "Administer \(weight * 10) ML"]],
                ["Epinephrine IM BOLUS" :  ["type" : "text",
                                            "content" : "\(weight * 10) MICROgrams (10 MICROgrams/KG) \nOR \n \(weight * 0.1) ML (0.1ML/KG)\n1:10 000 DILUTION\nMax: \(weight * 10)MICROgrams" ]],
                ["Epinephrine IV/IO BOLUS" :  ["type" : "text",
                                               "content" : "\(weight) MICROgrams (1 MICROgrams/KG) \nOR \n \(weight * 0.1) ML (0.1ML/KG)\n1:100 000 DILUTION\nMax: 1000 MICROgrams"]],
                ["Epinephrine IV/IO Infusion" :  ["type" : "text",
                                                  "content" : "0.02 - 0.2 MICROgram/kg/min"]],
                
                ["Secondary Treatment Drugs" : ["type" : "header"]],
                ["Anti-inflammatory" :  ["type" : "text",
                                         "content" : "Hydrocortisone IV/IO BOLUS (2 MILLIgrams/KG)\n\(weight*2) MILLIgrams"]],
                
                ["Hypotension Persisting despite epinephrine?" : ["type" : "header"]],
                ["Phenylephrine IV/IO BOLUS - 10 MICROgrams/KG" :  ["type" : "text",
                                                                    "content" : "Administer \(weight * 10) MICROgrams"]],
                ["Vasopressin IV/IO BOLUS - 0.03 units/KG" :  ["type" : "text",
                                                               "content" : "\(weight * 0.03) Units"]],
                ["NOREPINEPHRINE infusion" :  ["type" : "text",
                                               "content" : "0.01 - 0.20 MICROgram/KG/MIN"]],
                
                ["For Bronchospasm" : ["type" : "header"]],
                ["Salbutamol Inhaler" :  ["type" : "text",
                                          "content" : " 4 - 10 puffs"]],
                ["Aminophylline IV/IO SLOW BOLUS (1 Hour)" :  ["type" : "text",
                                                               "content" : "\(weight * 10) MILLIgrams \n(10 MILLIgrams/KG)"]],
                
                ["For Antihistamine" : ["type" : "header"]],
                ["Diphenhydramine IV/IO SLOW BOLUS" :  ["type" : "text",
                                                        "content" : "\(weight) MILLIgrams \n(1 MILLIgram/KG)"]],
                ["For Antihistamine" : ["type" : "header"]],
                ["Diphenhydramine IV/IO SLOW BOLUS" :  ["type" : "text",
                                                        "content" : "\(weight) MILLIgrams \n(1 MILLIgram/KG)"]]
            
        ]
        
    }
    
    static func CardiacArrest_NONSHOCKcontent (_ weight : Float) -> [[String : Any]] {
        return [["Steps" : ["type" : "checkList_CA-NS"]],
                ["Administering Adrenaline" : ["type" : "text",
                                               "content" : "IV/IO : Administer \n\(weight * 10) MICROgrams \n \(weight * 0.1)ML 1:10 000\n\nETT: Administer\n\(weight * 100) MICROgrams\n\(weight * 0.1)ML 1: 1000"]],
                ["Exclude H's and T's" : ["type" : "text",
                                          "content" : "HypoVolaemia\n   Hypoxia\n   Hydrogen Ion (Acidosis)\n   Hypokalaemia\n   HypoGlycaemia\n   HypoThermia\n   Trauma\n   Toxins\n   Tamponade\n   Tension Pneumothorax\n   Thrombosis (Pulmonary or Coronary)"]]
        ]
    }
    
    static func CardiacArrest_SHOCKcontent (_ weight : Float) -> [[String : Any]] {
        return [["Steps" : ["type" : "text",
                            "content" : "1.Call for help and Defibrillator \n2.DEFIBRILLATE ASAP"
            ]],
                ["Defillibration Algorithm" : ["type" : "header"]],
                
                ["1st Shock - 4J/KG" : ["type" : "text",
                                        "content" : "Administer \(weight * 4) JOULES\n(Resume CPR immediately without checking rhythm)"]],
                ["" : ["type" : "header"]],
                ["CPR: 1 - 2 minutes" : ["type" : "text",
                                         "content" : "(minimise time between shock and CPR) \n(Check rhythm & shock immediately after chest compression)"]],
                ["" : ["type" : "header"]],
                
                ["2nd Shock - 4J/KG" : ["type" : "text",
                                        "content" : "Administer \(weight * 4) JOULES\n(Resume CPR immediately without checking rhythm)"]],
                ["" : ["type" : "header"]],
                ["CPR: 1 - 2 minutes" : ["type" : "text",
                                         "content" : "(minimise time between shock and CPR) \n(Check rhythm & shock immediately after chest compression)"]],
                ["" : ["type" : "header"]],
                
                ["3rd Shock - 4J/KG" : ["type" : "text",
                                        "content" : "Administer \(weight * 4) JOULES\n(Resume CPR immediately without checking rhythm)"]],
                ["" : ["type" : "header"]],
                ["CPR: 1 - 2 minutes" : ["type" : "text",
                                         "content" : "(minimise time between shock and CPR) \n(Check rhythm & shock immediately after chest compression)"]],
                ["" : ["type" : "header"]],
                ["Adrenaline IV/IO: 10 MICROgrams/kg" : ["type" : "text",
                                        "content" : "\(weight * 10) MICROgrams\n \(weight * 0.1)ML  1: 10 000 Dilution"]],
                ["" : ["type" : "header"]],
                ["Amiodarone: 5 MILLIgrams/KG" : ["type" : "text",
                                         "content" : "\(weight * 5) MILLIgrams over 5 minutes"]],
                ["" : ["type" : "header"]],
                ["Shock - 4J/KG" : ["type" : "text",
                                        "content" : "Administer \(weight * 4) JOULES\n(Resume CPR immediately without checking rhythm)\nGive Adrenaline every other shock (3 - 5 minutes)"]],
                ["" : ["type" : "header"]],
                ["Shock - 4J/KG" : ["type" : "text",
                                    "content" : "Administer \(weight * 4) JOULES\n(Resume CPR immediately without checking rhythm)\nGive Adrenaline and Amiodarone"]],
                ["" : ["type" : "header"]],
                ["Shock - 4J/KG" : ["type" : "text",
                                    "content" : "Administer \(weight * 4) JOULES\n(Resume CPR immediately without checking rhythm)\nGive Adrenaline every other shock (3 - 5 minutes)"]],
                ["" : ["type" : "header"]],
                ["Shock - 4J/KG" : ["type" : "text",
                                    "content" : "Administer \(weight * 4) JOULES\n(Resume CPR immediately without checking rhythm)\nGive Adrenaline and Amiodarone (3rd and Last Dose!)"]],
                ["" : ["type" : "header"]],
                ["Continue till return of pulse" : ["type": "text",
                                                    "content": "Post resus care \n(Assist ventilation is required)"
                    ]]

                

                
        ]
    }
    
}
