//
//  EventCellViewModel.swift
//  Stalki
//
//  Created by Vinicius Mangueira on 20/10/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct EventCellViewModel {
    
    let repoName: String
    
    let categorieEvent: String
    
    init(_ event: Event) {
        self.repoName = event.repo.name
        switch event.type {
        case CategoriesEvent.push.rawValue:
            self.categorieEvent = "Pushed"
        case CategoriesEvent.fork.rawValue:
            self.categorieEvent = "Forked"
        case CategoriesEvent.pullRequest.rawValue:
            self.categorieEvent = "Pulled"
        case CategoriesEvent.issueComment.rawValue:
            self.categorieEvent = "Issue Commented"
        case CategoriesEvent.deleteEvent.rawValue:
                self.categorieEvent = "Deleted"
        case CategoriesEvent.deleteEvent.rawValue:
            self.categorieEvent = "Commited"
        default:
            self.categorieEvent = ""
        }
    }
}

enum CategoriesEvent: String {
    case push = "PushEvent"
    case fork = "ForkEvent"
    case pullRequest = "PullRequestEvent"
    case issueComment = "IssueCommentEvent"
    case deleteEvent = "DeleteEvent"
    case commited = "CommitCommentEvent"
}
