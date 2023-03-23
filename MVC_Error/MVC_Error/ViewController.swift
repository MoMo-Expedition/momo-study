import UIKit

class Model {
    weak var controller: ViewController?
    
    func fetchData(fetchedData: String) {
        controller?.updateView(data: fetchedData)
    }
}


class View: UIView {
    var model: Model?
    weak var controller: ViewController?
    
    func displayData(data: String) {
        // 데이터를 화면에 표시
    }
    
    func fetchData() {
        guard let controller = controller else { return }
        model?.fetchData(fetchedData: controller.inputedData)
    }
}


class ViewController {
    var model = Model()
    var view = View()
    var inputedData = ""
    
    func viewDidLoad() {
        model.controller = self
        view.controller = self
        view.model = model
    }
    
    func updateView(data: String) {
        view.displayData(data: data)
    }
}
