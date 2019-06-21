//
//  ViewController.swift
//  weather-zaichkin
//
//  Created by WSR on 6/20/19.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON




class ViewController: UIViewController {


    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var templab: UILabel!
    

    var city = ""
    var temp = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadData(city: city)
        cityNameLabel.text = city
    }
    
    

    
    
    func downloadData(city: String) {
       
        // токен для АПИ
        let token = "1e936ee21707e2a418e98dca00877357"
        
        // УРЛ с городом, метрической системой и токеном
        let urlStr = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(token)"
        
        // перекодируем адрес (URLencode)
        let url = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        // посылаем запрос
        //см. https://cocoapods.org/pods/SwiftyJSON Work with Alamofire
        Alamofire.request(url!, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                //если запрос выполнен успешно, то разбираем ответ и вытаскиваем нужные данные
                let json = JSON(value)
                self.temp = json["main"]["temp"].doubleValue
                self.templab.text = json["main"]["temp"].stringValue+"°C"
            case .failure(let error):
                print(error)
            }
        }
    }

}

