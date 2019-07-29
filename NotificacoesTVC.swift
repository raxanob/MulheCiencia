//
//  NotificacoesTVC.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 28/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import CoreData

class NotificacoesTVC: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerTempo.delegate = self
        pickerTempo.dataSource = self
        for i in 1...12 {
            vezes.append(String(i))
        }
        pickerData.append(vezes)
        pickerData.append(tempo)
        
    }
    
    
    @IBOutlet weak var pickerTempo: UIPickerView!
    
    
    @IBOutlet weak var switchSom: UISwitch!
    
    @IBOutlet weak var switchNotification: UISwitch!
    
    @IBAction func buttonEnviar(_ sender: Any) {
        let content = UNMutableNotificationContent()
        let center = UNUserNotificationCenter.current()
        //        som
        if switchSom.isOn{
            
            content.sound = UNNotificationSound.default
        }
        
        //        Notification
        if switchNotification.isOn == false {
            
            center.removeDeliveredNotifications(withIdentifiers: ["notification-identifier-here"])
            
        }
        
        //picker
        
        create_notification()
        navigationController?.popViewController(animated: true)
        
        
    }
    
    var pickerData: [[String]] = [[String]]()
    var vezes: [String] = [String]()
    let tempo = ["horas", "dias", "meses"]
    var context : NSManagedObjectContext? //nao
    var plant : Plant? = Plant() // nao
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var row = pickerView.selectedRow(inComponent: 0)
        if component == 0{
            return vezes.count
        }
        else{
            return tempo.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0{
            return String(vezes[row])
        }
        else{
            return String(tempo[row])
        }
    }
    
    func create_notification(){
        
        let notif = NSEntityDescription.insertNewObject(forEntityName: "Plant", into: context!) as! Plant
        notif.notificationPeriod = Int32(vezes[pickerTempo.selectedRow(inComponent: 0)])!
        notif.notificationInterv = tempo[pickerTempo.selectedRow(inComponent: 1)]
        notif.notificationTime = Data() as! NSDate
        
        switch tempo[pickerTempo.selectedRow(inComponent: 1)]{
        case "horas":
            let futureDate = Calendar.current.date(byAdding: .hour, value: Int(vezes[pickerTempo.selectedRow(inComponent: 0)])!, to: Date())
            notif.nextNotificationTime = futureDate as! NSDate
            
        case "dias":
            let futureDate = Calendar.current.date(byAdding: .day, value: Int(vezes[pickerTempo.selectedRow(inComponent: 0)])!, to: Date())
            notif.nextNotificationTime = futureDate as! NSDate
            
        case "meses":
            let futureDate = Calendar.current.date(byAdding: .month, value: Int(vezes[pickerTempo.selectedRow(inComponent: 0)])!, to: Date())
            notif.nextNotificationTime = futureDate as! NSDate
        default:
            fatalError("404 - Interval")
        }
        
    }
    
    
}
