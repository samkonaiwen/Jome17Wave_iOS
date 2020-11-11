//
//  AllGroupsViewController.swift
//  Jome17Wave_iOS
//
//  Created by Karena on 2020/11/10.
//

import UIKit

class AllGroupsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var groups = [PersonalGroup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllGroups()
        // Do any additional setup after loading the view.
    }
    
    struct PropertyKeys {
        static let allGroupsCell = "AllGroupsCell"
        static let statusCencel = " 已取消 "
        static let statusLast = " 最新發佈 "
        static let statusComing = " 即將開始 "
        static let statusFinished = " 已結束 "
    }
    
    func loadAllGroups(){
        let url = URL(string: "\(common_url)/jome_member/GroupOperateServlet")
        var requestParam = [String: Any]()
        requestParam["action"] = "getAll"
        executeTask(url!, requestParam) { (data, response, error) in
            if error == nil{
                if data != nil {
                    if let result = try? JSONDecoder().decode([PersonalGroup].self, from: data!){
                        self.groups = result
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AllGroupsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.allGroupsCell, for: <#T##IndexPath#>) as! GroupListTableViewCell
        let group = groups[indexPath.row]
        
        cell.groupNameLabel.text = group.groupName
        cell.groupLacationLabel.text = group.surfName
        cell.groupDateLabel.text = group.assembleTime
        
        switch group.groupStatus {
        case 0:
            cell.groupStatusLabel.backgroundColor = UIColor(named: "red")
            cell.groupStatusLabel.text = PropertyKeys.statusCencel
        case 1:
            cell.groupStatusLabel.backgroundColor = UIColor(named: "blue")
            cell.groupStatusLabel.text = PropertyKeys.statusLast
        case 2:
            cell.groupStatusLabel.backgroundColor = UIColor(named: "yellow")
            cell.groupStatusLabel.text = PropertyKeys.statusComing
        case 3:
            cell.groupStatusLabel.backgroundColor = UIColor(named: "green")
            cell.groupStatusLabel.text = PropertyKeys.statusFinished
        default:
            print("Group Status Error")
        }
         return cell
    }
    
    
}
