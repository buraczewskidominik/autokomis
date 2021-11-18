//
//  SellersCarsViewController.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import UIKit

protocol SellersCarsViewControllerDelegate: AnyObject {
    
    func didClickAddCar()
    
    func didChooseCar(_ car: Car)
}

final class SellersCarsViewController: UIViewController {
    
    // MARK: Sections
    
    enum Section {
        case main
    }
    
    // MARK: Properties
    
    weak var delegate: SellersCarsViewControllerDelegate?
    
    var viewModel: SellersCarsViewModel!
    
    // MARK: Datasource
    
    private lazy var dataSource = UITableViewDiffableDataSource<Section, Car>(tableView: carsTableView) { tableView, indexPath, car in
        let carCell = tableView.dequeueReusableCell(withIdentifier: CarCell.identifier, for: indexPath) as? CarCell
        let carCellViewModel = CarCellViewModel(car: car)
        carCell?.viewModel = carCellViewModel
        carCell?.setUpContent()
        return carCell
    }
    
    // MARK: UI
    
    private lazy var carsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CarCell.self, forCellReuseIdentifier: CarCell.identifier)
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private lazy var addCarBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            title: Localizable.Common.SellersCars.addCar,
            style: .plain,
            target: self,
            action: #selector(addCar)
        )
        return barButtonItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        applySnapshot(for: viewModel.getMockedCars(), animated: false)
    }
    
    private func setUpUI() {
        carsTableView.dataSource = dataSource

        view.addSubviews(carsTableView)

        carsTableView.addConstraints { [
            $0.equal(.safeAreaTop),
            $0.equal(.leading),
            $0.equal(.trailing),
            $0.equal(.bottom)
        ] }
        
        if viewModel.userIsSeller() {
            setUpNavigationBar()
        }
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        navigationItem.rightBarButtonItems = [addCarBarButtonItem]
    }
    
    @objc func addCar() {
        delegate?.didClickAddCar()
    }
    
    private func applySnapshot(for cars: [Car], animated: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Car>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cars)
        dataSource.apply(snapshot, animatingDifferences: animated, completion: nil)
    }
}

// MARK: UITableViewDelegate methods

extension SellersCarsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        delegate?.didChooseCar(viewModel.getAvailableCars()[indexPath.row])
        delegate?.didChooseCar(viewModel.getMockedCars()[indexPath.row])
    }
}
