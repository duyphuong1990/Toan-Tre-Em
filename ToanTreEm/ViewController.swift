//
//  ViewController.swift
//  ToanTreEm
//
//  Created by Duy Phuong on 5/9/17.
//  Copyright © 2017 Duy Phuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    @IBOutlet weak var lbl_kq: UILabel!
    @IBOutlet weak var lbl_dau: UILabel!
    
    @IBOutlet weak var lbl_dung: UILabel!
    @IBOutlet weak var lbl_sai: UILabel!
    @IBOutlet weak var lbl_thoigian: UILabel!
   
    @IBAction func btn_a(_ sender: Any) {
        setRandom()
        ktkq(sender as! UIButton)
        start()
    }
    
    
    @IBOutlet weak var btn_1: UIButton!
    
    @IBOutlet weak var btn_2: UIButton!

    @IBOutlet weak var btn_3: UIButton!
    
    
    var random1:Int!
    var random2:Int!
    var tgian = Timer()
    var demso = 0
    var dung = 0
    var sai = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tgian = Timer.scheduledTimer(timeInterval:1.0, target:self, selector: #selector(dem), userInfo: nil, repeats: true)
        start()
        setRandom()
       
    }
    func start() {
        demso = 10
    }

    func dem() {
        demso -= 1
        lbl_thoigian.text = "\(demso)"
        if (demso == 0){
            start()
            setRandom()
            sai = sai + 1
            lbl_sai.text = String(sai)
        }
    }
    func setRandom() {
        random1 = Int(arc4random_uniform(9)) + 1
        random2 = Int(arc4random_uniform(9)) + 1
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        
    
        setDau()
        
    }
    func setDau() {
        let dau = Int(arc4random_uniform(4))
        print(dau)
        if dau == 0 {
            lbl_dau.text = "+"
            
        }
        if dau == 1 {
            lbl_dau.text = "-"
            
        }
        if dau == 2 {
            lbl_dau.text = "x"
            
        }
        if dau == 3 {
            lbl_dau.text = ":"
            var du = random1 % random2
            while (du != 0) {
                random1 = Int(arc4random_uniform(9))+1
                random2 = Int(arc4random_uniform(8))+1
                du = random1 % random2
                lbl_p1.text = String(random1)
                lbl_p2.text = String(random2)
            }
            
        }
        setvitri()
        
    }

    
    
    func setvitri() {
        
        let vitri = Int(arc4random_uniform(2))
        if vitri == 0 {
            btn_1.setTitle(String(random1), for: .normal)
            btn_2.setTitle(String(random2), for: .normal)
            btn_3.setTitle(String(ketqua()), for: .normal)
        }
        else if vitri == 1 {
            btn_1.setTitle(String(random1), for: .normal)
            btn_3.setTitle(String(random2), for: .normal)
            btn_2.setTitle(String(ketqua()), for: .normal)
        }
        else {
            btn_3.setTitle(String(random1), for: .normal)
            btn_2.setTitle(String(random2), for: .normal)
            btn_1.setTitle(String(ketqua()), for: .normal)
        }
        
        
    }
    
        
    func ketqua() -> Int {
        var ketqua = 0
        if lbl_dau.text == "+" {
            ketqua = cong(p1: Int(lbl_p1.text!)!, p2: Int(lbl_p2.text!)!)
        }
        if lbl_dau.text == "-" {
            ketqua = tru(p1: Int(lbl_p1.text!)!, p2: Int(lbl_p2.text!)!)
        }
        if lbl_dau.text == "x" {
            ketqua = nhan(p1: Int(lbl_p1.text!)!, p2: Int(lbl_p2.text!)!)
        }
        if lbl_dau.text == ":" {
            ketqua = chia(p1: Int(lbl_p1.text!)!, p2: Int(lbl_p2.text!)!)
        }
        return ketqua
    }
        
        
    
    
    func cong(p1:Int, p2:Int) -> Int {
        return p1 + p2
    }
    
    func tru(p1: Int, p2:Int) -> Int {
        return p1 - p2
    }
    
    func nhan(p1 :Int, p2: Int) -> Int {
        return p1 * p2
    }
    
    func chia(p1:Int, p2:Int) -> Int {
        return p1 / p2
    }
    func ktkq(_ sender: UIButton)  {
        lbl_dung.text = String (dung)
        lbl_sai.text = String (sai)
        let tong = (Int(lbl_p1.text!)! + Int(lbl_p2.text!)!)
        let hieu = (Int(lbl_p1.text!)! - Int(lbl_p2.text!)!)
        let nhan = (Int(lbl_p1.text!)! * Int(lbl_p2.text!)!)
        let chia = (Int(lbl_p1.text!)! / Int(lbl_p2.text!)!)
        if  tong == (Int(sender.currentTitle!)) || hieu == (Int(sender.currentTitle!)) || nhan == (Int(sender.currentTitle!)) || chia == (Int(sender.currentTitle!))
        {
            dung = dung + 1
            lbl_dung.text = String(dung)
        }else{
            sai = sai + 1
            lbl_sai.text = String(sai)
        }
    }

}

