//
//  DetailTodoVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 14..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import GoogleMaps
class DetailTodoVC: UITableViewController {

    let apim = APIM()
    

    @IBOutlet weak var isMy: UILabel!
    @IBOutlet weak var callbtn: UIButton!
    @IBOutlet weak var joinbtn: UIButton!
    var user_index = UserDefaults.standard.integer(forKey: "user_index")
    
    var todo : BuiltIn?
    
    @IBOutlet weak var todo_content: UITextView!
    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todo_status: UILabel!
    @IBOutlet weak var apply_limit: UILabel!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var user_img: UIImageView!
    @IBOutlet weak var user_sex: UILabel!
    @IBOutlet weak var user_age: UILabel!
    @IBOutlet weak var meeting_date: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if(Int((todo?.user_index)!) == self.user_index){
            isMy.isHidden = false
            print ("DetailTodoVC 내글이군")
            let ad = UIApplication.shared.delegate as! AppDelegate
            
            self.user_sex.text = ad.user.user_sex
            self.user_age.text = ad.user.user_age
            self.user_img.image = UIImage(named:ad.user.user_img!)
            self.user_name.text = ad.user.user_name
            self.joinbtn.isHidden = true
            self.callbtn.isHidden = true
            
        }else{
            self.user_sex.text = todo!.user_sex
            self.user_age.text = todo!.user_age
            self.user_img.image = UIImage(named:todo!.user_img!)
            self.user_name.text = todo!.user_name

        }
        
        user_img.layer.borderWidth = 0
        user_img.layer.masksToBounds = true
        user_img.layer.cornerRadius = user_img.frame.height/2
        user_img.clipsToBounds = true
        
        todoTitle.text = todo!.builtein_title
        
        var str = "::::"
        str = todo!.builtein_meeting_date!
        var arr = str.components(separatedBy: ":")
        let _arr = arr[0]+"-"+arr[1]+"-"+arr[2]+" "+arr[3]+":"+arr[4]
        meeting_date.text = _arr
        
        todo_content.text = todo!.builtein_content

        
        let limit = todo!.builtein_apply_limit
        
        self.apply_limit.text = limit?.description
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("DetailTodoVC시작 useridx = \(UserDefaults.standard.integer(forKey: "user_index"))")
    }
    override func viewDidDisappear(_ animated: Bool) {
        
            print("DetailVC끝 useridx = \(UserDefaults.standard.integer(forKey: "user_index"))")
        
    }

    @IBAction func joinAction(_ sender: Any) {
        print("joinAction 시작 \(user_index)")
        
        let alert = UIAlertController(title:"신청하기", message: "\(todo!.user_name!)님께 메시지를 전달하세요", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        
        let ok = UIAlertAction(title:"신청",style:.default){
            (_) in
            var msg : String?
            if alert.textFields?[0].text != ""{
                msg = alert.textFields?[0].text
                print("join 확인 시작 \(self.user_index)")
                
                self.apim.setApi(path: "/addApply", method: .post, parameters: ["user_index":self.user_index, "bulletin_index":self.todo?.builtein_index!,"apply_message":msg!])
                self.apim.addApply{(success) in
                    if(success == 1 ){
                        let alr = UIAlertController(title: "알림", message: "신청되었습니다.", preferredStyle: .alert)
                        
                        let ca = UIAlertAction(title: "확인", style: .cancel)
                        alr.addAction(ca)
                        self.present(alr, animated: true)
                    }
                }
                
                
            }else{
                let alr = UIAlertController(title: "알림", message: "메시지를 입력하세요", preferredStyle: .alert)
                
                let ca = UIAlertAction(title: "확인", style: .cancel)
                alr.addAction(ca)
                self.present(alr, animated: true)

            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "안녕하세요"
        })
        
        self.present(alert, animated: true)
        print("인덱스 \(todo!.builtein_index!)")
       
        
      print("joinAction 끝 \(user_index)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containMap"{
            var vcmap = segue.destination as?GoogleMapVC
        let posi = CLLocationCoordinate2D(latitude: (todo?.builtein_latitude)!, longitude: (todo?.builtein_longitude)!)
        print("detailTodoVC 프리페어 + \(posi)")
        vcmap?.searchLocation = posi
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    


}
