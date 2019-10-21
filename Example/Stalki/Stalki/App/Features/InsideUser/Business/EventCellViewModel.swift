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
        case CategoriesEvent.createEvent.rawValue:
            self.categorieEvent = "Create Event"
        case CategoriesEvent.issuesEvent.rawValue:
            self.categorieEvent = "Issue Evented"
        case CategoriesEvent.commited.rawValue:
                   self.categorieEvent = "Commited"
        case CategoriesEvent.pullRequestReview.rawValue:
                           self.categorieEvent = "Reviewed"
        case CategoriesEvent.watched.rawValue:
            self.categorieEvent = "Watched"
        case CategoriesEvent.member.rawValue:
            self.categorieEvent = "Member"
        case CategoriesEvent.publicEvent.rawValue:
            self.categorieEvent = "Public"
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
    case createEvent = "CreateEvent"
    case issuesEvent = "IssuesEvent"
    case pullRequestReview = "PullRequestReviewCommentEvent"
    case watched = "WatchEvent"
    case member = "MemberEvent"
    case publicEvent = "PublicEvent"
}
