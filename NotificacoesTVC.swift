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
    
    //O appDelegate é chamado para usar seu novo método de notificação
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerTempo.delegate = self
        pickerTempo.dataSource = self
        for i in 1...12 {
            vezes.append(String(i))
        }
        pickerData.append(vezes)
        pickerData.append(tempo)
        
        //linhas so nos objetos nao na tableview inteira
        tableView.tableFooterView = UIView()
    }
    
    @IBOutlet weak var pickerTempo: UIPickerView!
    
    var pickerSelectedVezes = ""
    var pickerSelectedTempo = ""
    
    @IBOutlet weak var switchSom: UISwitch!
    
    @IBOutlet weak var switchNotification: UISwitch!
    
    @IBAction func buttonEnviar(_ sender: Any) {
        do {
            notificationCenter.removeDeliveredNotifications(withIdentifiers: ["NotificacaoCell"])
        } catch {
            //        som
            if switchSom.isOn{
                
                content.sound = UNNotificationSound.default
            }
            
            //        Notification
            if switchNotification.isOn == false {
                notificationCenter.removeDeliveredNotifications(withIdentifiers: ["NotificacaoCell"])
                
            }
            
            //Nas variáveis abaixo definimos o corpo da mensagem
            let not = InternNotif.getAllNotif()
            let notram = not[Int.random(in: 0..<7)]
            let titulo = notram.titulo
            let subtitulo = ""
            let mensagem = notram.descricao
            
            //O identificador serve para o caso de queremos identificar uma notificação especifica
            let identificador = "identifier\(Int.random(in: 0..<7))"
            var tempo:TimeInterval = 1
            if pickerSelectedTempo == self.tempo[0] {
                print("horas")
                tempo = tempo * 3600 * Double(pickerSelectedVezes)!
                
            } else if pickerSelectedTempo == self.tempo[1] {
                print("dias")
                tempo = tempo * 86400 * Double(pickerSelectedVezes)!
            } else {
                print("meses")
                tempo = tempo * 2628000 * Double(pickerSelectedVezes)!
            }
            
            self.appDelegate?.enviarNotificacao(titulo, subtitulo, mensagem, identificador, tempo)
            navigationController?.popViewController(animated: true)
        }
    }
    
    let content = UNMutableNotificationContent()
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    var pickerData: [[String]] = [[String]]()
    var vezes: [String] = [String]()
    let tempo = ["horas", "dias", "meses"]
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            self.pickerSelectedVezes = self.vezes[row]
        }
        else{
            self.pickerSelectedTempo = self.tempo[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label:UILabel
        
        if let v = view as? UILabel{
            label = v
        }
        else{
            label = UILabel()
        }
        
        label.textColor = #colorLiteral(red: 0.9835441709, green: 0.3933441639, blue: 0.02250329219, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Anonymous Pro", size: 20)
        
        if component == 0{
            label.text = vezes[row]
        }
        else {
            label.text = tempo[row]
        }
        return label
        
    }
}
