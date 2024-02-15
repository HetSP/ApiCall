import UIKit

class ViewController: UIViewController {
    var result: [String : String] = [:]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
   
    func callAPI() {
        guard let url = URL(string: "https://ipinfo.io/161.185.160.93/geo") else { return }

        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let result = json as? [String: String] {
                        self.result = result
                        print(self.result)
                        DispatchQueue.main.async {
                            self.tableView.reloadData() // Reload table view data once data is fetched
                        }
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            } else {
                print("No data received from API")
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let fact = result["ip"] {
            cell.textLabel?.text = fact
        } else {
            cell.textLabel?.text = "Unknown"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondScreen") as! SecondViewController
        vc.result = result
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
