//
//  CityTableViewController.swift
//  weather-zaichkin
//
//  Created by WSR on 6/20/19.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {

    var cityArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //Добавление первой записи в массив
        cityArray.append("Оренбург")
        cityArray.append("Москва")
        cityArray.append("Санкт-Петербург")
        cityArray.append("Томск")
        //Изменение фона tableview
        tableView.backgroundView = UIImageView.init(image: UIImage(named:"Untitled"))
        //перерисовка tableview
        tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    //Количество секций или групп ячеек. Минимум 1!
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //Количество ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityArray.count
    }

    //Реализация самой ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //Создание объекта ячейки из ячейки с идентификатором "cityCell" и классом CityTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CellTableViewCell
        //Присвоение значения label
        cell.label.text = cityArray[indexPath.row]
        //Очистка цвета фона в ячейке, чтобы было видно картинку
        cell.backgroundColor = UIColor.clear
        return cell
    }
    // Высота ячейки
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source - Удаление из массива
            cityArray.remove(at: indexPath.row)
            //удаление из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)

        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     //Обработка перехода
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toMain" {
             //Создание объекта класса назначения, чтобы обратиться к переменной
             let vc = segue.destination as! ViewController
             //Получение индекса выбираемой ячейки
             let index = self.tableView.indexPathForSelectedRow
             //присвоение значения
             vc.city = cityArray[(index?.row)!]
         }
     }
     //Добавление нового города
     @IBAction func addCity(_ sender: Any) {

         //Создание объекта alert
         let alert = UIAlertController(title: "Добавление город", message: "Добавьте пожалуйста город!", preferredStyle: .alert)
         //Добавление поля для ввода
         alert.addTextField { (textField) in
     }

        //Добавление действия в случае ОК
     alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (alertAction) in
         //Получаем значение которое ввел пользователь
        //в алерте может быть несколько текстовых полей, поэтому нужно вытаскиваем по индексу
        let textField = alert.textFields![0] as UITextField
         //Добавление в массив
        //в свой список городов добавляем новый элемент
        self.cityArray.append(textField.text!)
         // Перерисовка обновляем отображение
         self.tableView.reloadData()
         }))
        //Добавление действия в случае Cancel
     alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
     
     }))
         //Добавление alert на экран
         self.present(alert, animated: true, completion: nil)
         }


}
 
