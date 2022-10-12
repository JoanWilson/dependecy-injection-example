//
//  ViewModel.swift
//  SingletonVsDI
//
//  Created by Joan Wilson Oliveira on 09/10/22.
//

import Foundation

// MARK: - ViewModel
class HomeViewModel {

    @Published var posts: [Post] = []
    let dataService: DataServiceProtocol

    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        getPosts()
    }

    private func getPosts() {
        dataService.downloadPosts { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let posts):
                self.posts = posts
            case .failure(let error):
                print(error)
            }
        }
    }

}
