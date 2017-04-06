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
	
	static func LA_Recognition (weight :Float) -> [[String: Any]]{
		return [["Sudden alteration in mental status" : ["type": "text",
		                                                 "content" : "1.Severe agitation\n2.Loss of Consciousness."]
			],
		        ["Cardiovascular Collapse" : ["type": "text",
		                                      "content" : "1.Sinus bradycardia\n2.Conduction block\n3.Ventricular Tachyarrhythmias\n4. Asystole\n\n Note:\nHypothension & Rhythm disturbance may be the only signs under GA"]
					
			]
		]
	}
	
	static func LA_Management (weight: Float) -> [[String: Any]]{
		return [["Steps" : ["type":"LA_Management"]]]
	}
	
	static func LA_treatment_NeuroToxicity (weight : Float) -> [[String: Any]]{
		return [["Give drugs" : ["type" : "text",
		                         "content": "Give benzodiazepine, thiopentone or propofol in small incremental doses"]
			],
		        ["Midazolam IV - 0.05 MG/KG" : ["type" : "text",
		                                        "content": "Give \(weight * 0.05) MG"]
			],
		        ["Thiopentone IV - 4MG/KG" : ["type" : "text",
		                                      "content": "Give \(weight * 4 ) MG"]
			],
		        ["Propofol IV - 1MG/KG" : ["type" : "text",
		                                   "content": "Give \(weight * 1) MG"]
			]]
	}
	
	static func LA_treatment_CardiotoxicityWithCA (weight : Float) -> [[String : Any]]{
		return [["Step 1" : ["type":"text",
		                     "content" : "Start CPR"
			]],
		        ["" : ["type" : "header"]],
		        ["Step 2" : ["type": "text",
		                     "content": "Administer Intralipid Therapy"]
			]]
	}
	
	static func LA_treatment_CardiotoxicityWOCA (weight : Float) -> [[String : Any]]{
		return [["Use conventional therapies" : ["type":"text",
		                                         "content" : "Hypotension\nBradycardia\nTachyarrhythmias"
			]],
		        ["Hypotension Epinephrine IV" : ["type": "text",
		                                         "content": "\(weight * 1) MICROgrams (1 MICROgram/KG)\nOR\n\(weight*0.1)ML (0.1ML/KG)\n1: 100 000 Dilution"]],
		        ["Arrhythmia" : ["type": "text",
		                         "content": "Avoid Calcium Channel Blockers\nAvoid Beta Blockers\n*Ligocaine should NOT be used as an antiarrhythmic therapy!\nConsider IV Lipid Emulsion Therapy"]
					
			]]
	}
	
	static func LA_treatment_Intralipid (weight :Float) -> [[String : Any]]{
		return [ ["Immediate" : ["type" : "header"]],
		         ["BOLUS IV - 1.5ML/KG" : ["type" : "text",
		                                   "content": "Administer \(weight * 1.5) ML over 1 Min"
					]],
		         
		         ["INFUSION IV - 15ML/KG" : ["type" : "text",
		                                     "content": "Administer \(weight * 15) ML over 1 Hour"
					]],
		         ["After 5 Minutes (if cardiovascular stability isn't restored)" : ["type" : "header"]],
		         ["BOLUS" : ["type" : "text",
		                     "content": "Repeat bolus up to maximum of 2X (same dose)\n5 minutes apart \n(TOTAL 3 colus including initial dose!)"
					]],
		         
		         ["Double rate of infusion - 30ML/KG/H" : ["type" : "text",
		                                     "content": "\(weight * 30) ML over 1 Hour"
					]],
		         ["Cumulative dosage limit for infusion - 30 ML/KG/H" : ["type" : "text",
		                                                   "content": "\(weight * 12) ML"
					]]
			
		]
	}
	
	static func Hyperkalaemia_criteria (weight : Float) -> [[String : Any]]{
		return [["Exclusion criteria": ["type": "text",
		                                "content" : "Premature Neonates"
			]],
		        ["Inclusion Criterias" : ["type":"header"]],
		        ["Term NEONATE (< 1 month age)": ["type": "text",
		                                 "content" : "Serum K+ > 6 Mmol/L"
					]],
		         ["Children > 1 month age": ["type": "text",
					"content" : "Serum K+ > 5.5 Mmol/L"
					]]
		]
	}
	
	static func Hyperkalaemia_ManagementAlgorithms (weight: Float) -> [[String : Any]]{
		return [["Things to take note of" : ["type": "HyperK_MA_1"]],
		        ["Exclude:" : ["type" : "HyperK_MA_2"]]
		]
	}
	
	static func Hyperkalaemia_SerumDosage (weight: Float) -> [[String : Any]]{
		return [
			["For 5.5 - 6.0 mmol/L" : ["type":"header"]],
			
			["Initial Treatment" : ["type": "HyperK_Serum_1_1"]],
			["Review: K+ not improving" : ["type" : "HyperK_Serum_1_2"]],
			["Review: K+ improving" : ["type" : "HyperK_Serum_1_3"]],
			
			["For 6.1 - 6.9 mmol/L" : ["type":"header"]],
			
			["Initial Treatment" : ["type": "HyperK_Serum_2_1"]],
			["Review: K+ not improving" : ["type" : "HyperK_Serum_2_2"]],
			["Review: K+ improving" : ["type" : "HyperK_Serum_2_3"]],
			
			["For > 7.0 mmol/L" : ["type":"header"]],
			
			["Initial Treatment" : ["type": "HyperK_Serum_3_1"]],
			["Review: K+ not improving" : ["type" : "HyperK_Serum_3_2"]],
			["Review: K+ improving" : ["type" : "HyperK_Serum_2_3"]]
		]
	}
	
	static func Hyperkalaemia_Treatment (weight : Float) -> [[String : Any]]{
		return [["Do" : ["type": "HyperK_treatment_1"]],
		        ["Without delaying therapy, consider" : ["type" : "HyperK_treatment_2"]],
		        ["Drugs" : ["type": "header"]],
		        ["Salbutanol 0.5% Solution" : ["type":"text",
		                                       "content": "Nebulise with 8L oxygen\n<25 KG: 2.5MG in 4ML of NS Q1-2H\n>25 KG: 5MG in 4ML of NS Q1-2H"]],
		        ["Regular Insulin (Actrapid) via IV - 0.1 IU/KG" : ["type":"text",
		                                       "content": "Administer \(weight * 0.1) IU\nOnset for 15-20 min\nDuration: 4-6 Hours\nRemarks:\n- Administer together with DEXTROSE\n- 1 IU to every 5g glucose\n- MAX: 10 IU per dose\n- Check H/C; may cause hypoglycemia\n- May be repeated"]],
		        ["Dextrose 10% via IV - 5 ML /KG" : ["type":"text",
		                                                            "content": "Administer \(weight * 5)ML\nRemarks:\nAdminister together with Insulin"]],
		        ["Dextrose 50% via IV - 1 ML/KG" : ["type":"text",
		                                                            "content": "Administer \(weight * 1) ML\nRemarks:\n- Administer via large bone peripheral IV or central venous access\n- Administer together with insulin"]],
		        ["10% Calcium gluconate via IV - 0.5 ML/KG" : ["type":"text",
		                                                            "content": "Administer \(weight * 0.5) ML\nOnset 5-10min\nDuration:30-60min\nremarks:\n- May cause hyper calcaemia & tissue necrosis\n- May be repeated"]],
		        ["10% Calcium Chloride via IV - 0.2 ML/KG" : ["type":"text",
		                                                            "content": "Administer \(weight * 0.2) ML"]],
		        ["8.4% NaHCO3 via IV - 1 ML/KG" : ["type":"text",
		                                                            "content": "Administer \(weight * 1) ML\nRemarks:\n- Give over 10 min\n- DO NOT mix with calcium\n- Max: 50 Mmol/dose"]]
		        
		]
		
	}
	
	static func MH_recognition (weight : Float) -> [[String : Any]]{
		return [["Differential Diagnosis" : ["type": "text",
		                                     "content" : "1. Inadequate anaesthesia or analgesia\n2. Inappropriate breathing circuit, fresh gas flow or ventilation\n3. Infection or sepsis\n4. Tourniquet ischaemia\n5. Anaphylaxis\n5. Pheochromocytoma\n6. Thyroid storm"]],
		        ["Clinical Recognition" : ["type": "text",
		                                     "content" : "1. Unexplained increase in ETCO2\n2. Unexplained Tachycardia\n3. Unexplained increase in Oxygen requirements\n4. Trunk or limb rigidity\n5. Masseter spasm (Trismus)\n6. Unstable or rising blood pressure\n7. Respiratory & Metabloic Acidosis\n8. Arrhythmias\n9. Temperature changes are a LATE sign"]],
		        ["Biochemical Recognition" : ["type": "text",
		                                      "content" : "1. increased PaCO2\n2. decreased PH\n3. increased serum K\n4. decreased PaO2\n5. increased creatine kinase\n6. myoglobinuria"]]
		        
		]
	}
	
	static func MH_Management (weight : Float) -> [[String : Any]]{
		return [["Immediate Management" : ["type": "text",
		                                   "content" : "1. Call for help\n2. STOP all triggers (turn OFF VOLATILE anaesthetics)\n3. Get MH Box with Dantrolene\n4. Notify surgeon\n5. Install clean breathing circuit\n6. Hyperventilate with 100% oxygen\n7. Maintain anaesthesia with IV anaesthetics\n8. Muscle relaxation with Non-Depolarising neuromuscular blockers\n9. Finish/ abandon surgery ASAP"]],
		        ["Monitor" : ["type": "text",
		                      "content" : "1. Call for help\n2. STOP all triggers (turn OFF VOLATILE anaesthetics)\n3. Get MH Box with Dantrolene\n4. Notify surgeon\n5. Install clean breathing circuit\n6. Hyperventilate with 100% oxygen\n7. Maintain anaesthesia with IV anaesthetics\n8. Muscle relaxation with Non-Depolarising neuromuscular blockers\n9. Finish/ abandon surgery ASAP"]]
		]
	}
	
	static func MH_Treatment (weight : Float ) -> [[String : Any]]{
		return [["Treat Arrhythmias" : ["type" : "text",
		                                "content" : "**Avoid Calcium channel blockers\nCan use Amiodarone"
			]],
		        ["Treat METABOLIC ACIDOSIS" : ["type" : "text",
		                                       "content" : "Hyperventilate\nNaHCO3"
					]],
		        ["Treat MYOGLOBINURIA" : ["type" : "text",
		                                  "content" : "forced alkaline diuresis (mannitol/frusemide+NaHCO3) may require renal replacement therapy later)"
					]],
		        ["Treat METABOLIC ACIDOSIS" : ["type" : "text",
		                                       "content" : "Hyperventilate\nNaHCO3"
					]],
		        ["Treat DIC (if present)" : ["type" : "text",
		                                     "content" : "FFP, Cryoppt, Platelets"
					]],
		        ["COOL patient if temp > 39 degrees celsius" : ["type" : "text",
		                                                        "content" : "Cold IV NS, ice saline lavage, surface ice packs\nStop cooling when temp 38 degrees celsius and falling"
					]],
		        ["Dantrolene" : ["type" : "header"]],
		        ["Dantrolene" : ["type" : "text",
		                         "content" : "each vial cobtains 20MILLIgrams of dantrolene\nDissolve 1 vial in 60 ML sterile water\ndantrolene potentiates neuromuscular blockers"
					]],
		        ["Application of Dantrolene - 2.5 MG/KG" : ["type" : "text",
		                                       "content" : "Administer \(weight * 2.5) MG of Dantrolene intravenously and rapidly"
					]],
		        ["subsequent dantrolene boluses" : ["type" : "text",
		                                            "content" : "\(weight * 1) MILLIgrams intravenously \n(1 MILLIgram/KG)\n(every 5 minutes til symptoms subside or up to total of 10 MILLIgrams/KG)"
					]]
		        
		]
	}
	
}
