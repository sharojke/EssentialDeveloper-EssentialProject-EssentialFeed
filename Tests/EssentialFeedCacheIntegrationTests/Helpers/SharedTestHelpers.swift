import EssentialFeed
import Foundation

func anyData() -> Data {
    return Data("any data".utf8)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func uniqueImage() -> FeedImage {
    return FeedImage(
        id: UUID(),
        url: anyURL()
    )
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let items = [uniqueImage(), uniqueImage()]
    let localItems = items.map { feedItem in
        LocalFeedImage(
            id: feedItem.id,
            url: feedItem.url,
            description: feedItem.description,
            location: feedItem.location
        )
    }
    return (items, localItems)
}

// MARK: - Used for policy

extension Date {
    private var feedCacheMaxAgeInDays: Int {
        return 7
    }
    
    func adding(seconds: TimeInterval) -> Self {
        return self + seconds
    }
    
    func adding(
        minutes: Int,
        calendar: Calendar = Calendar(identifier: .gregorian)
    ) -> Self {
        return calendar.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func adding(
        days: Int,
        calendar: Calendar = Calendar(identifier: .gregorian)
    ) -> Self {
        return calendar.date(byAdding: .day, value: days, to: self)!
    }
    
    func minusFeedCacheMaxAge() -> Self {
        return self.adding(days: -feedCacheMaxAgeInDays)
    }
}
