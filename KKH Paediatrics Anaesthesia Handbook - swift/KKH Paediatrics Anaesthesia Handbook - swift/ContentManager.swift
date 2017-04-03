//
//  ContentManager.swift
//  KKH Paediatrics Anaesthesia Handbook - swift
//
//  Created by Seannn! on 3/4/17.
//  Copyright © 2017 SST inc. All rights reserved.
//

import UIKit

class ContentManager: NSObject {
    
    //store dictionaries that build content modularly
    
    var BasicLifeSupport : [[String : Any]] = [ ["Steps" : ["type" : "checkList",
                                                        "content" : ["Open airway", "Check for spontaneous Breathing","Check pulse (fermoral & brachial preferable in children) for not more than 10 seconds"]]],
                                                
                                                ["Pulse Present, Breathing absent" : ["type" : "text",
                                                                                      "content" : " 1 Breath every 3 seconds \n(Breathe a thousand, 2 a thousand, 3 a thousand then repeat cycle) \n\nRe-check pulse every 2 minutes"]],
                                                
                                                ["Pulse Absent, Breathing absent" : ["type" : "text",
                                                                                      "content" : " Lone rescuer: complete 2 minutes (5 cycles) of CPR before calling EMS\n\nSned someone to call EMS immediately if not alone"]],
                                                
                                                ["Single Rescuer" : ["type" : "text",
                                                                                      "content" : " 30 compressions : 2 breaths"]],
                                                
                                                ["Healthcare Provider: Team Resuscitation" : ["type" : "text",
                                                                                      "content" : " No advanced airway- 15 compressions : 2 breaths \n\n Advanced airway (LMA/ ETT)-  provide 100 compressions & 10 ventilations per minute \n\n Push Hard Push Fast \n\n Minimise interruptions to compressions \n\n Rotate roles to avoid fatigue \n\n Recheck pulse every 2 minutes"]]]
    
    

}
