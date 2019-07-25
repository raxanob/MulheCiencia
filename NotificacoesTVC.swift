////
////  NotificacoesTVC.swift
////  ChellengeFerias
////
////  Created by Rayane Xavier on 22/07/19.
////  Copyright © 2019 Rayane Xavier. All rights reserved.
////
//
//import Foundation
//import UIKit
//import UserNotifications
//
//class NotificacoesTVC: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//    let vezes = [1,2,3,4,5,6,7,8,9,10,11,12]
//
//
//    
//
//    //
//    @IBOutlet weak var vezesPicker: UIPickerView!
//
//    func numberOfComponents(in vezesPicker: UIPickerView) -> Int {
//        return 1
//    }
//
//    private func pickerView(_ vezesPicker: UIPickerView, titleForRow row: Int, forComponent: Int) -> Int{
//        return vezes[row]
//    }
//    
//    func pickerView(_ vezesPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
//        return vezes.count
//    }
//
//    
//
//    //tempo
//
//    @IBOutlet weak var tempoPicker: UIPickerView!
//    let tempo = ["dia", "semana", "mes"]
//
//    
//    
//    @IBOutlet weak var notifDesativarSwitch: UISwitch!
//
//    @IBOutlet weak var somSwitch: UISwitch!
//    
//
//
//    @IBAction func enviarButton(_ sender: Any) {
//
//        let notificationCenter = UNUserNotificationCenter.current()
//        let content = UNMutableNotificationContent()
//
//
//        //som
//        if somSwitch.isOn{
//            content.sound = UNNotificationSound.default
//        }
//
//    }
//
//
//}
