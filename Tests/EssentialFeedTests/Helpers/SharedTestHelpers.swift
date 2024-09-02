import EssentialFeed
import Foundation

// swiftlint:disable force_unwrapping
// swiftlint:disable force_try

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func makeItemsJSON(_ items: [[String: Any]]) -> Data {
    let json = ["items": items]
    return try! JSONSerialization.data(withJSONObject: json)
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

func uniqueImage() -> FeedImage {
    return FeedImage(
        id: UUID(),
        url: anyURL()
    )
}

extension HTTPURLResponse {
    convenience init(statusCode: Int) {
        self.init(
            url: anyURL(),
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
    }
}

extension Date {
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
}

// swiftlint:enable force_unwrapping
// swiftlint:enable force_try
