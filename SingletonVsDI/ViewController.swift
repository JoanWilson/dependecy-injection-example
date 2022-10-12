//
//  ViewController.swift
//  SingletonVsDI
//
//  Created by Joan Wilson Oliveira on 09/10/22.
//

import UIKit
import Combine

protocol DataServiceProtocol {
    func downloadPosts(completion: @escaping (Result<[Post], Error>) -> ())
}

class ViewController: UIViewController {

    private let viewModel: HomeViewModel
    private var cancellables: Set<AnyCancellable> = []

    init(dataService: DataServiceProtocol) {
        self.viewModel = HomeViewModel(dataService: dataService)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        addBinders()
    }

    private func addBinders() {
        viewModel.$posts.sink { [weak self] returnedPosts in
            guard let _ = self else { return }

            returnedPosts.forEach { post in
                print(post.title)
            }
        }.store(in: &cancellables)
    }

}

